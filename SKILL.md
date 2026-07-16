---
name: headspace_design
description: "Guidelines and reference documentation for the Headspace-coloured Wise Design System (Neptune Design System structure), including its typography, Headspace colour palette, core grid spacing, border radii, and 50+ UI components and patterns."
---

# Headspace Design System (Neptune CSS structure + Headspace colour) Skill

You are equipped with the knowledge of the **Wise / Neptune Design System** structure, recoloured with the **Headspace Brand Colour Palette**. Typography, spacing, radii, components, and patterns follow Wise/Neptune; **colour is 100% Headspace** (source: `live.standards.site/headspace/color`, updated September 2024).

---

## 1. Design System Core Principles

### Core Aesthetics & Brand Colours
* **Bright, hopeful & approachable:** The Headspace palette is bright, joyful, and fresh, showcasing the spectrum of emotions.
* **The Orange Identity:** Orange is the most-recognizable brand colour, inspired by the traditions of meditation and practice. Use orange freely, supported by white and dark grey.
* `Orange 200`: `#FF7300` (primary brand colour, used for key interactive accent surfaces, e.g., Primary Buttons).
* `Warm Grey 700`: `#2D2C2B` (the "black" text colour, used for text/icons and core interactivity).
* `White`: `#FFFFFF`.
* **Secondary Palette:** Adds vibrancy to illustrations, layouts, and UI; often used as layout backgrounds. Introduce it once orange is nicely established.
* `Yellow 200`: `#FFCE00`
* `Blue 200`: `#0061EF`
* `Green 200`: `#01A652`
* `Pink 200`: `#FFA1CC`
* `Purple 200`: `#9E65C6`
* `Warm Grey 100`: `#F9F4F2`
* **Context palettes:** Keep palettes context-locked — never mix Sleep (Indigo/Winkle) with Core-palette layouts.
* `Core` (default): Orange 200, Warm Grey 700, White, Yellow 200, Blue 200, Green 200, Pink 200, Purple 200, Warm Grey 100.
* `Sleep`: Winkle 200/300, Indigo 200/300, plus accents of Yellow 200, Pink 200, Blue 100/200, White.
* `Care`: leads with Yellow 200, plus Blue 100/200, Orange 200, Pink 200, Purple 200.

### Semantic Product Tokens
* `Content Primary`: Light mode `#2D2C2B` / Dark mode `#F9F4F2` (`--color-content-primary`)
* `Content Secondary`: Light mode `#63605D` / Dark mode `#E2DED9` (`--color-content-secondary`)
* `Content Tertiary`: Light mode `#A8A5A0` / Dark mode `#C6C1B9` (`--color-content-tertiary`)
* `Content Link`: Light mode `#FF7300` / Dark mode `#FFA500` (`--color-content-link`)
* `Interactive Primary`: Light mode `#FF7300` / Dark mode `#FFA500` (`--color-interactive-primary`)
* `Interactive Accent`: Light mode `#FF7300` / Dark mode `#FF7300` (`--color-interactive-accent`)
* `Background Screen`: Light mode `#FFFFFF` / Dark mode `#141313` (`--color-background-screen`)
* `Background Elevated`: Light mode `#FFFFFF` / Dark mode `#2D2C2B` (`--color-background-elevated`)
* `Border Neutral`: Light mode `#2D2C2B` (12% opacity) / Dark mode `#FFFFFF` (20% opacity) (`--color-border-neutral`)

---

## 2. Typography
* **Wise Sans:** Custom display font, heavy and uppercase. Used only for display headings and key success/celebration moments (e.g., Success screen).
* **Inter:** Standard functional sans-serif typeface. Used for all form inputs, body text, UI actions, and links to maximize readability and accessibility.
* **Text Hierarchy:**
* Display 1 (Heavy 56px to 128px, Line height 85%)
* Heading 1 (Semi Bold 42px to 78px, Line height 46px to 82px)
* Heading 2 (Semi Bold 37px to 53px)
* Body 2 (Regular/Semi Bold 16px to 18px)
* Body 3 (Regular/Semi Bold 14px to 16px)

---

## 3. Spacing Grid & Border Radii
* **Grid:** 8px base grid (`size-4` = 4px, `size-8` = 8px, `size-12` = 12px, `size-16` = 16px, `size-24` = 24px, `size-32` = 32px).
* **Horizontal Semantic Spacing:**
* `between-cards`: `size-12` (12px)
* `between-chips`: `size-8` (8px)
* `screen-mobile`: `size-24` (24px)
* `component-default`: `size-16` (16px)
* **Vertical Semantic Spacing:**
* `between-text`: `size-8` (8px)
* `display-text-bottom`: `size-16` (16px)
* `text-to-component`: `size-16` (16px)
* `content-to-button`: `size-24` (24px)
* `between-sections`: `size-32` (32px)
* **Radii (Mobile):**
* `radius-small`: 10px
* `radius-medium`: 16px
* `radius-large`: 24px
* `radius-x-large`: 32px
* `radius-2x-large`: 48px

---

## 4. Neptune CSS Reference Code

When building web applications using the Neptune design system, implement layouts by referencing the styling class hooks:
```html
<!-- Primary Button Example -->
<button class="wds-Button wds-Button--large wds-Button--primary">
<span class="wds-Button-content">
<span class="wds-Button-label">
<span class="wds-Button-labelText">Send Money</span>
</span>
</span>
</button>

<!-- Section Header Example -->
<div class="np-section-header">
<h2 class="np-text-heading-2">Send Money</h2>
</div>
```

Refer to the detailed reference documents:
* [Foundations Guide](references/foundations.md) - Exact hex values, typographic scales, spacing tokens, accessibility tables.
* [Components Guide](references/components.md) - Rules, props, and variants for 50+ components (Buttons, Cards, Inputs, Modals, etc.).
* [Patterns Guide](references/patterns.md) - Rules and design guidelines for layouts, screens (success, error), and notification grids.
* [Assets Selection Guide](assets_guide.md) - Naming conventions and lookup details for the 1,293 integrated design assets.

> [!NOTE]
> Colour is sourced 100% from the Headspace Brand Design System. The bundled reference screenshots in `assets/` are the original Wise product mockups and are **not** recoloured — treat them as layout/structure references, and apply the Headspace palette above for colour.
