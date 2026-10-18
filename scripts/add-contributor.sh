#!/usr/bin/env bash
# Usage: scripts/add-contributor.sh <github-username>
# Invites the user as a collaborator (Write) and creates their branch edits-<username>.
# Requires the GitHub CLI (gh) signed in as a repository admin.
set -euo pipefail

user=${1:?Usage: $0 <github-username>}
[[ $user =~ ^[A-Za-z0-9-]+$ ]] || { echo "Invalid GitHub username: $user" >&2; exit 1; }

repo=$(gh repo view --json nameWithOwner --jq .nameWithOwner)
branch="edits-$user"

gh api -X PUT "repos/$repo/collaborators/$user" -f permission=push --silent
echo "Invitation sent to $user (Write access). They must accept it at https://github.com/$repo/invitations"

if gh api "repos/$repo/git/ref/heads/$branch" >/dev/null 2>&1; then
  echo "Branch $branch already exists"
else
  sha=$(gh api "repos/$repo/git/ref/heads/main" --jq .object.sha)
  gh api -X POST "repos/$repo/git/refs" -f ref="refs/heads/$branch" -f sha="$sha" --silent
  echo "Created branch $branch"
fi

echo
echo "Send them this link:"
echo "https://app.pagescms.org/${repo}/${branch}/"
