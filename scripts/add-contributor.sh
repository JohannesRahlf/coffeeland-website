#!/usr/bin/env bash
# Usage: scripts/add-contributor.sh <name> [--github <github-username>]
#
# Creates the personal branch edits-<name> for a contributor and prints their personal
# Pages CMS link plus a welcome message to send them.
#
# Contributors are invited by email in Pages CMS (Collaborators, no GitHub account needed);
# that step is done in the Pages CMS interface. Use --github only for someone who works
# with a GitHub account: it also invites that user as a repository collaborator (Write).
#
# Requires the GitHub CLI (gh) signed in as a repository admin.
set -euo pipefail

name=${1:?Usage: $0 <name> [--github <github-username>]}
shift || true
slug=$(printf '%s' "$name" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$//')
[ -n "$slug" ] || { echo "Could not make a branch name from: $name" >&2; exit 1; }

github_user=""
if [ "${1:-}" = "--github" ]; then
  github_user=${2:?--github needs a GitHub username}
  [[ $github_user =~ ^[A-Za-z0-9-]+$ ]] || { echo "Invalid GitHub username: $github_user" >&2; exit 1; }
fi

repo=$(gh repo view --json nameWithOwner --jq .nameWithOwner)
branch="edits-$slug"

if [ -n "$github_user" ]; then
  gh api -X PUT "repos/$repo/collaborators/$github_user" -f permission=push --silent
  echo "GitHub invitation sent to $github_user (Write). They must accept it at https://github.com/$repo/invitations"
fi

if gh api "repos/$repo/git/ref/heads/$branch" >/dev/null 2>&1; then
  echo "Branch $branch already exists"
else
  sha=$(gh api "repos/$repo/git/ref/heads/main" --jq .object.sha)
  gh api -X POST "repos/$repo/git/refs" -f ref="refs/heads/$branch" -f sha="$sha" --silent
  echo "Created branch $branch"
fi

link="https://app.pagescms.org/${repo}/${branch}/"

cat <<MSG

Next step (in your browser): Pages CMS -> Collaborators -> Invite -> paste $name's email address.

------------------------------------------------------------
Subject: Your CoffeeLand website editor

Hello $name,

You can now edit the CoffeeLand website. You will also receive an invitation email
from Pages CMS: use it to sign in.

Your personal link (please save it as a bookmark):
$link

Always open the website editor through this link. If you ever see an error when you
save, you are probably on a different page: just go back to this link and try again.

Your changes are checked by us before they appear on the website, so you cannot break
anything. If you are unsure about something, write to us before you save.

Best regards
------------------------------------------------------------
MSG
