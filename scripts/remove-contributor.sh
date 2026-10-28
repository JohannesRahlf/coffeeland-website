#!/usr/bin/env bash
# Usage: scripts/remove-contributor.sh <name> [--github <github-username>] [--force]
#
# Deletes the personal branch edits-<name>. Refuses if the branch has an open pull request
# (merge or close it first) unless --force is given: unmerged work on the branch is lost.
# With --github it also removes that user's repository access or pending invitation.
# Remove the person's email in Pages CMS -> Collaborators yourself.
set -euo pipefail

name=${1:?Usage: $0 <name> [--github <github-username>] [--force]}
shift || true
slug=$(printf '%s' "$name" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$//')
[ -n "$slug" ] || { echo "Could not make a branch name from: $name" >&2; exit 1; }

github_user=""; force=0
while [ $# -gt 0 ]; do
  case "$1" in
    --github) github_user=${2:?--github needs a GitHub username}; shift 2 ;;
    --force) force=1; shift ;;
    *) echo "Unknown option: $1" >&2; exit 1 ;;
  esac
done
[ -z "$github_user" ] || [[ $github_user =~ ^[A-Za-z0-9-]+$ ]] || { echo "Invalid GitHub username" >&2; exit 1; }

repo=$(gh repo view --json nameWithOwner --jq .nameWithOwner)
owner=${repo%%/*}
branch="edits-$slug"

open=$(gh api "repos/$repo/pulls?head=$owner:$branch&state=open" --jq 'length')
if [ "$open" != "0" ] && [ "$force" != "1" ]; then
  echo "Branch $branch has an open pull request. Merge or close it first, or use --force." >&2
  exit 1
fi

if [ -n "$github_user" ]; then
  gh api -X DELETE "repos/$repo/collaborators/$github_user" --silent || true
  inv=$(gh api "repos/$repo/invitations" --jq ".[] | select(.invitee.login==\"$github_user\") | .id")
  [ -z "$inv" ] || gh api -X DELETE "repos/$repo/invitations/$inv" --silent
fi

gh api -X DELETE "repos/$repo/git/refs/heads/$branch" --silent 2>/dev/null && echo "Deleted branch $branch" || echo "No branch $branch to delete"
echo "Reminder: also remove $name's email in Pages CMS -> Collaborators."
