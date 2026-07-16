# Wise Design System - Assets Selection & Usage Guide

This guide describes how to select and integrate any of the **1,293 downloaded design system assets** (illustrations, diagrams, component visuals, and layout mocks) stored under `skills/wise_design/assets/`.

---

## 1. Directory & Naming Structure

All visual assets are stored in:
`skills/wise_design/assets/`

Filenames are structured predictably using Contentful metadata to help you query and search for files programmatically or manually:
`[category]_[pageslug]_[clean_alt_text]_[index].[extension]`

### Decoding Examples
* `foundations_colour_the_wise_card_34.png`
* **Category:** `foundations`
* **Subpage:** `colour` (the color system documentation)
* **Subject:** A graphic depicting "The Wise card" color usage.
* **Asset ID:** `34`
* `components_button_media_button_used_for_a_da_769.png`
* **Category:** `components`
* **Subpage:** `button` (or `media-button`)
* **Subject:** A button style used for dark/media elements.
* `patterns_success-screen_a_tick_illustration_1215.png`
* **Category:** `patterns`
* **Subpage:** `success-screen`
* **Subject:** Green tick illustration for successful transaction screens.

---

## 2. Choosing Assets for Specific Contexts

Use this index to quickly pick the right asset type for your designs or specifications:

### Brand Assets & Tapestries
* **Logos:** Search for `foundations_logo_...`
* **Tapestry Backgrounds:** Search for `foundations_tapestries_...`
* **Secondary Color Combinations:** Search for `foundations_colour_secondary_...`

### Typography & Spacing Guides
* **Font Styles (Wise Sans/Inter):** Search for `foundations_typography_...`
* **Spacing Rules (Horizontal/Vertical):** Search for `foundations_spacing_...`
* **Border Radius Scales:** Search for `foundations_radius_...`
* **Icons Grid Systems:** Search for `foundations_icons_...`

### Component Blueprints
Choose component previews by their exact UI category:
* **Prompts & Banners:** `components_action-prompt_...`, `components_critical-banner_...`, or `components_info-prompt_...`
* **Input Forms:** `components_text-input_...`, `components_date-input_...`, `components_money-input_...`, or `components_select_...`
* **Lists:** `components_list-item_...` (includes button items, checkbox items, radio items, switches).
* **Overlays & Surfaces:** `components_bottom-sheet_...`, `components_modal_...`, or `components_popover_...`

### Layout Patterns & Screen Outlines
Use these to model full page templates:
* **Success Screen:** `patterns_success-screen_...` (Tick animations, illustrations).
* **Error Screen:** `patterns_error-screen_...` (Error alert layouts).
* **Loading Screen:** `patterns_progress-screen_...` (Shimmers, progress bars).
* **Banners & Callouts:** `patterns_banner-card_...` or `patterns_callout-large_...`
* **Hero Headers:** `patterns_hero-large_...` or `patterns_hero-simple_...`

---

## 3. How to Reference Assets in Markdown

Depending on where you are writing documentation, use the correct relative file path to ensure files render correctly on GitHub and IDE editors:

### A. Inside a Reference Guide (in `skills/wise_design/references/`)
Since the references files are inside a subdirectory, walk up one folder (`../`):
```markdown
![Success Tick Illustration](../assets/patterns_success-screen_a_tick_illustration_1215.png)
```

### B. Inside the Main `SKILL.md` (in `skills/wise_design/`)
Reference directly using the local path:
```markdown
![Wise Spacing Grid](assets/foundations_spacing_semantic_tokens_320.png)
```

### C. Inside a Project Workspace (when using the skill)
If the design system skill is imported as a workspace tool, reference it via absolute workspace pathing or copy it to the local app assets directory.
