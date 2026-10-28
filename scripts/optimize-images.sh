#!/usr/bin/env bash
# Usage: scripts/optimize-images.sh <directory> [max-dimension]
#
# Shrinks the images (jpg, jpeg, png, webp) in <directory>, in place:
#   - scales them down to fit within max x max pixels (default 2000)
#   - recompresses them (JPEG/WebP quality 82)
#   - removes all metadata, including GPS location
# A file is only replaced when the result is smaller, or when it had GPS data.
# Meant for the deploy build (CI workspace), not for files you commit. Needs ImageMagick.
set -uo pipefail

dir=${1:?Usage: $0 <directory> [max-dimension]}
max=${2:-2000}
limit_bytes=512000
limits="-limit memory 512MiB -limit map 512MiB -limit disk 1GiB -limit time 60"
before=0; after=0

while IFS= read -r -d '' f; do
  [ -f "$f" ] && [ ! -L "$f" ] || continue
  lower=${f,,}
  case "$lower" in
    *.jpg|*.jpeg) fmt=jpeg ;;
    *.png)        fmt=png ;;
    *.webp)       fmt=webp ;;
    *)            continue ;;
  esac

  size=$(stat -c %s "$f")
  dims=$(identify $limits -format '%w %h' "$fmt:$f[0]" 2>/dev/null) || { echo "unreadable, skipped: $f"; continue; }
  read -r w h <<<"$dims"
  gps=$(identify $limits -format '%[EXIF:GPSLatitude]' "$fmt:$f[0]" 2>/dev/null || true)
  [ "$gps" = "unknown" ] && gps=""

  if [ "$size" -le "$limit_bytes" ] && [ "$w" -le "$max" ] && [ "$h" -le "$max" ] && [ -z "$gps" ]; then
    continue
  fi

  case "$fmt" in
    jpeg) q="-sampling-factor 4:2:0 -quality 82 -interlace Plane" ;;
    webp) q="-quality 82" ;;
    png)  q="" ;;
  esac
  tmp="$f.optimized"
  if convert $limits "$fmt:$f[0]" -auto-orient -resize "${max}x${max}>" -strip $q "$fmt:$tmp"; then
    new=$(stat -c %s "$tmp")
    if [ "$new" -lt "$size" ] || [ -n "$gps" ]; then
      mv -f "$tmp" "$f"
      echo "$f: $size -> $new bytes (${w}x${h}${gps:+, GPS removed})"
      before=$((before + size)); after=$((after + new))
    else
      rm -f "$tmp"
      echo "$f: not smaller, left as is"
    fi
  else
    rm -f "$tmp"
    echo "$f: could not be converted, left as is"
  fi
done < <(find "$dir" -type f -print0)

echo "Optimized images: $before -> $after bytes"
