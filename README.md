# headspace_design — a Headspace-coloured build of the Wise/Neptune design skill

This is a new skill based on your **GWDS** `wise_design` skill. Everything —
typography, spacing, radii, components, patterns, the Inter fonts, and all 1,293
reference mockups — is kept identical. **The only change is colour:** the palette
and semantic tokens are swapped to the **Headspace** colours from
`HSDS/colors.md`.

## What changed

Colour definitions live in only two files, and only those two were rewritten:

| File | Change |
| --- | --- |
| `SKILL.md` | Brand Colours + Semantic Product Tokens → Headspace palette |
| `references/foundations.md` | `## 1. Colour System` section → Headspace palette (core, secondary, accent, neutral, and all product/semantic tokens) |

Everything else is byte-for-byte the original:
`references/components.md` (contains no colour values), `references/patterns.md`,
`assets_guide.md`, `fonts/`, and `assets/`.

## Key colour mapping (Wise → Headspace)

| Role | Wise | Headspace |
| --- | --- | --- |
| Primary brand / accent | Bright Green `#9FE870` | Orange 200 `#FF7300` |
| Dark primary / "black" text | Forest Green `#163300` | Warm Grey 700 `#2D2C2B` |
| Content secondary | `#454745` | Warm Grey 500 `#63605D` |
| Content link | `#163300` | Orange 200 `#FF7300` |
| Dark-mode screen bg | `#121511` | Warm Grey 800 `#141313` |

Full token tables are in `references/foundations.md`.

## Building the complete skill

The two recoloured markdown files are here already. To produce a full, ready-to-
use skill folder that also includes the fonts and all 1,293 asset PNGs, run:

```bash
./build.sh                 # clones GWDS from GitHub (~528MB) and assembles
# or, if you already have GWDS cloned locally:
./build.sh /path/to/GWDS
```

This writes `./headspace_design_full/` — a complete skill you can drop into your
skills directory.

## Note on the screenshots

The `assets/` PNGs are the original Wise product mockups and are **not**
recoloured (recolouring flat screenshots isn't possible without the source
files). Use them for layout/structure reference; apply the Headspace palette for
all colour.
