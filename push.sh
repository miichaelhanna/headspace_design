#!/usr/bin/env bash
#
# push.sh — Fill the headspace_design repo with the bulk files from GWDS.
#
# The repo already has the recoloured SKILL.md, references/foundations.md,
# assets_guide.md, README.md and the scripts. This script adds the parts that
# couldn't be uploaded through the browser:
#   - references/components.md   (unchanged, ~150KB)
#   - references/patterns.md     (unchanged, ~100KB)
#   - fonts/                     (5 Inter TTFs)
#   - assets/                    (1,293 PNGs, ~528MB)
# ...then commits and pushes them.
#
# HOW TO RUN (on your Mac):
#   1) git clone https://github.com/miichaelhanna/headspace_design.git
#   2) cd headspace_design
#   3) bash push.sh
#
# Prerequisites: git, and push access to the repo (gh auth login, or a
# credential helper / SSH key already set up).
#
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$HERE"

if [[ ! -f SKILL.md || ! -d references ]]; then
  echo "ERROR: run this from the root of your headspace_design clone (where SKILL.md lives)." >&2
  exit 1
fi

TMP="$(mktemp -d)"
echo "Cloning GWDS (~528MB of assets — this can take a few minutes)..."
git clone --depth 1 https://github.com/miichaelhanna/GWDS.git "$TMP/GWDS"
SRC="$TMP/GWDS/skills/wise_design"
[[ -f "$SRC/SKILL.md" ]] || { echo "ERROR: wise_design skill not found in GWDS clone."; exit 1; }

echo "Copying bulk files (fonts, assets, components.md, patterns.md)..."
mkdir -p references fonts assets
cp "$SRC/references/components.md" references/components.md
cp "$SRC/references/patterns.md"   references/patterns.md
cp -R "$SRC/fonts/."  fonts/
cp -R "$SRC/assets/." assets/

# NOTE: SKILL.md, references/foundations.md and assets_guide.md are intentionally
# NOT copied — the repo already holds the recoloured / correct versions.

echo "Committing and pushing..."
git add -A
git commit -m "Add fonts, 1,293 assets, and components.md/patterns.md from GWDS"
git push origin main

rm -rf "$TMP"
echo
echo "Done. Everything is now in https://github.com/miichaelhanna/headspace_design"
