# Design System Documentation: The Serene Path

This design system is a bespoke framework crafted specifically for a smoking cessation journey. It moves away from the clinical, high-stress visuals typical of medical apps, favoring an approach we call **"The Digital Sanctuary."** The goal is to provide a sense of calm, steady progress, and high-end editorial clarity.

---

## 1. Creative North Star: The Digital Sanctuary
The "Digital Sanctuary" philosophy prioritizes breathability and emotional safety. By utilizing expansive whitespace, intentional asymmetry, and "tonal layering," we create an environment that reduces cortisol levels rather than inducing "task anxiety." 

The layout should feel like a high-end wellness journal—authoritative yet supportive. We break the "generic app" mold by shunning rigid boxes and harsh dividers in favor of organic depth and soft, overlapping transitions.

---

## 2. Color Theory & Tonal Depth
Our palette is rooted in deep teals and soft neutrals, designed to convey stability.

### The "No-Line" Rule
**Explicit Instruction:** Designers are prohibited from using 1px solid borders for sectioning content. Boundaries must be defined through background color shifts or subtle tonal transitions. For example, a `surface-container-low` card sitting on a `surface` background provides all the definition needed without the "noise" of a stroke.

### Surface Hierarchy & Nesting
Treat the UI as a physical stack of fine paper. 
- **Base:** `surface` (#f9f9ff) for the overall screen.
- **Secondary Sections:** `surface-container-low` (#f1f3ff) for grouping content.
- **Interactive Elements:** `surface-container-lowest` (#ffffff) for high-focus cards.

### The Glass & Gradient Rule
To move beyond a flat "bootstrap" look, use Glassmorphism for floating navigation bars or modular overlays.
- **Glass Effect:** Apply `surface` at 80% opacity with a 16px backdrop-blur.
- **Signature Gradients:** For primary CTAs or progress heroes, use a subtle linear gradient from `primary` (#005c55) to `primary_container` (#0f766e). This adds a "soul" to the color that flat hex codes lack.

---

## 3. Typography: Editorial Support
We use **Manrope** for its modern, geometric structure that maintains a warm, human touch.

- **Display (LG/MD):** Used for celebration moments (e.g., "30 Days Smoke-Free"). Use `on_surface` with tight letter-spacing (-0.02em) to create an authoritative, editorial feel.
- **Headlines:** Set the tone for new sections. They should feel like book chapter titles—spaced generously from the content below.
- **Body (LG/MD):** Optimized for readability with a line height of 1.6 to ensure minimal cognitive load during high-stress moments.
- **Labels:** Use `on_surface_variant` (#3e4947) to provide meta-information without competing with the primary narrative.

---

## 4. Elevation & Depth: Tonal Layering
Traditional shadows are often "dirty." In this system, we use light and color to create lift.

### The Layering Principle
Depth is achieved by "stacking" surface tiers. Place a `surface_container_lowest` card (Pure White) on a `surface_container_high` (#e1e8fd) background to create a soft, natural lift without a single shadow.

### Ambient Shadows
When a floating effect is required (e.g., a "Quick Craving" button):
- **Blur:** 24px - 40px.
- **Opacity:** 4% - 8%.
- **Color:** Use a tinted shadow (`primary_fixed_variant` at low opacity) rather than grey. This mimics natural light passing through a translucent object.

### The "Ghost Border" Fallback
If accessibility requires a border, use the **Ghost Border**: `outline_variant` at 15% opacity. Never use 100% opaque strokes.

---

## 5. Component Architecture

### Buttons: The "Pill" Form
- **Primary:** Fully rounded (`full` radius / 9999px). Uses the signature Teal gradient.
- **Secondary:** `secondary_container` background with `on_secondary_container` text. No border.
- **Tertiary:** Pure text with `primary` color, used for "Cancel" or "Skip" to reduce visual weight.

### Cards & Content Lists
- **Rule:** Forbid the use of divider lines.
- **Separation:** Use 24px - 32px of vertical white space (the 8pt grid) or a shift from `surface` to `surface-container-low`.
- **Radius:** All cards must use `md` (1.5rem) or `lg` (2rem) corner radius to maintain the "soft" brand personality.

### Input Fields
- **Style:** Background-filled using `surface_container_high` with no border.
- **Focus State:** Transition the background to `surface_container_lowest` and add a subtle `primary` "Ghost Border" (20% opacity).

### Specialized Components for Quitra
- **The Breath Module:** A semi-transparent glass container with a pulsing `primary_fixed` glow to guide rhythmic breathing.
- **The Progress Arc:** A thick-stroke gauge using `primary` against a `surface_variant` track, avoiding thin, "wire-like" indicators.

---

## 6. Do’s and Don’ts

### Do:
- **Embrace Asymmetry:** Place a headline on the left and a supporting stat on the right with different vertical alignments to create an "editorial" look.
- **Use "Breathing Room":** If you think a section has enough padding, add 8px more.
- **Contextual Success:** Use the `tertiary` (warm earth tones) for "Urge Defeated" moments to provide a grounding, human contrast to the cool Teal.

### Don’t:
- **Don't use 1px Dividers:** It creates "visual fences" that make the user feel boxed in.
- **Don't use Pure Black:** Always use `on_surface` (#141b2b) for text to keep the contrast soft on the eyes.
- **Don't use Default Shadows:** Avoid the "dirty" drop shadow look; if it doesn't look like ambient light, don't use it.