#!/usr/bin/env bash
#
# build.sh — Assemble the full "headspace_design" skill.
#
# It takes the original Wise skill from your GWDS repo (fonts, all 1,293 PNG
# assets, and the unchanged reference guides) and drops in the two recoloured
# files that ship next to this script (SKILL.md + references/foundations.md),
# which carry the Headspace colour palette.
#
# Usage:
#   ./build.sh                      # clones GWDS from GitHub, then builds
#   ./build.sh /path/to/GWDS        # uses a local GWDS checkout instead
#
# Output:  ./headspace_design_full/   (a complete, ready-to-use skill folder)

set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="${1:-}"
OUT="$HERE/headspace_design_full"
REPO="https://github.com/miichaelhanna/GWDS.git"

# 1. Get the original Wise skill.
if [[ -z "$SRC" ]]; then
  TMP="$(mktemp -d)"
  echo "Cloning GWDS (this includes ~528MB of assets, may take a while)..."
  git clone --depth 1 "$REPO" "$TMP/GWDS"
  SRC="$TMP/GWDS/skills/wise_design"
else
  # Accept either the repo root or the skill folder directly.
  [[ -d "$SRC/skills/wise_design" ]] && SRC="$SRC/skills/wise_design"
fi

if [[ ! -f "$SRC/SKILL.md" ]]; then
  echo "ERROR: could not find the wise_design skill at: $SRC" >&2
  exit 1
fi

# 2. Copy the original skill, then overwrite the two recoloured files.
echo "Assembling skill into: $OUT"
rm -rf "$OUT"
cp -R "$SRC" "$OUT"

cp "$HERE/SKILL.md"                    "$OUT/SKILL.md"
cp "$HERE/references/foundations.md"   "$OUT/references/foundations.md"

# 3. Done.
echo
echo "Done. Complete Headspace-coloured skill is at:"
echo "  $OUT"
echo
echo "Contents:"
echo "  SKILL.md                 (recoloured — Headspace palette)"
echo "  references/foundations.md (recoloured — Headspace palette)"
echo "  references/components.md  (unchanged — no colour values)"
echo "  references/patterns.md    (unchanged)"
echo "  assets_guide.md           (unchanged)"
echo "  fonts/                    (Inter, unchanged)"
echo "  assets/                   (1,293 Wise mockups, unchanged / not recoloured)"
