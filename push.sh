#!/usr/bin/env bash
#
# push.sh — Assemble the full "headspace_design" skill and push it to a NEW
#           GitHub repo, from YOUR machine (where you're logged in to GitHub).
#
# Why you have to run this (not the assistant): creating a repo and pushing
# both require your GitHub credentials, and the assistant's sandbox has no
# network access to GitHub.
#
# Prerequisites:
#   - git
#   - GitHub CLI (`gh`)  ->  https://cli.github.com   (run `gh auth login` once)
#
# Usage:
#   ./push.sh                       # repo name defaults to "headspace_design"
#   ./push.sh my-repo-name          # custom repo name
#   ./push.sh my-repo-name /path/to/GWDS   # use a local GWDS checkout
#
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_NAME="${1:-headspace_design}"
GWDS_SRC="${2:-}"
VISIBILITY="private"          # change to "public" if you want a public repo
WORK="$HERE/.push_build"

command -v gh  >/dev/null || { echo "ERROR: GitHub CLI (gh) not found. Install from https://cli.github.com"; exit 1; }
command -v git >/dev/null || { echo "ERROR: git not found."; exit 1; }

# 1. Get the original Wise skill (fonts + all 1,293 assets + unchanged refs).
if [[ -z "$GWDS_SRC" ]]; then
  echo "Cloning GWDS (~528MB of assets, may take a while)..."
  rm -rf "$WORK/GWDS"
  mkdir -p "$WORK"
  git clone --depth 1 https://github.com/miichaelhanna/GWDS.git "$WORK/GWDS"
  SRC="$WORK/GWDS/skills/wise_design"
else
  [[ -d "$GWDS_SRC/skills/wise_design" ]] && GWDS_SRC="$GWDS_SRC/skills/wise_design"
  SRC="$GWDS_SRC"
fi
[[ -f "$SRC/SKILL.md" ]] || { echo "ERROR: wise_design skill not found at $SRC"; exit 1; }

# 2. Assemble the repo contents: skills/headspace_design/<full skill>
REPO_DIR="$WORK/$REPO_NAME"
rm -rf "$REPO_DIR"
mkdir -p "$REPO_DIR/skills"
cp -R "$SRC" "$REPO_DIR/skills/headspace_design"

# Drop in the two recoloured files (they live next to this script).
cp "$HERE/SKILL.md"                  "$REPO_DIR/skills/headspace_design/SKILL.md"
cp "$HERE/references/foundations.md" "$REPO_DIR/skills/headspace_design/references/foundations.md"
cp "$HERE/README.md"                 "$REPO_DIR/README.md"

# 3. Init git and push to a new repo.
cd "$REPO_DIR"
git init -q
git add -A
git -c user.email="$(git config --global user.email || echo you@example.com)" \
    -c user.name="$(git config --global user.name || echo you)" \
    commit -qm "headspace_design: Headspace-coloured Wise/Neptune design skill"

echo "Creating GitHub repo '$REPO_NAME' ($VISIBILITY) and pushing..."
gh repo create "$REPO_NAME" --"$VISIBILITY" --source=. --remote=origin --push

echo
echo "Done. Repo pushed:"
gh repo view "$REPO_NAME" --json url -q .url
