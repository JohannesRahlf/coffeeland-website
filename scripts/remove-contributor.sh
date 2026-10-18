#!/usr/bin/env bash
# Usage: scripts/remove-contributor.sh <github-username>
# Removes the collaborator (or pending invitation) and deletes their branch edits-<username>.
# Unmerged work on the branch is lost: merge or close their pull request first.
set -euo pipefail

user=${1:?Usage: $0 <github-username>}
[[ $user =~ ^[A-Za-z0-9-]+$ ]] || { echo "Invalid GitHub username: $user" >&2; exit 1; }

repo=$(gh repo view --json nameWithOwner --jq .nameWithOwner)
branch="edits-$user"

gh api -X DELETE "repos/$repo/collaborators/$user" --silent
inv=$(gh api "repos/$repo/invitations" --jq ".[] | select(.invitee.login==\"$user\") | .id")
[ -n "$inv" ] && gh api -X DELETE "repos/$repo/invitations/$inv" --silent
gh api -X DELETE "repos/$repo/git/refs/heads/$branch" --silent 2>/dev/null || echo "No branch $branch to delete"
echo "Removed $user"
