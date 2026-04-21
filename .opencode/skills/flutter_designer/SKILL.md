---
name: flutter_designer
description: This document acts as a specialized instruction set for designing and implementing the Quitra Flutter app. It ensures all UI/UX work strictly adheres to "The Serene Path" design system.
---

# Quitra Flutter Designer Skill

This document acts as a specialized instruction set for designing and
implementing the Quitra Flutter app. It ensures all UI/UX work strictly adheres
to "The Serene Path" design system.

## 1. Core Identity: The Digital Sanctuary

**Philosophy:** Quitra is a high-end wellness journal for smoking cessation. The
UI must reduce cortisol, reduce task anxiety, and provide editorial clarity.

- **Rule of Thumb:** If it feels crowded, add 8px more padding.
- **Visual Style:** Asymmetric layouts, organic depth, soft overlapping
  transitions. No rigid boxes.
- **Offline Excellence:** Since the app is strictly offline, design for zero
  latency. Avoid heavy "loading" states for local data; focus on instant
  transitions and optimistic UI updates for long-running local operations (like
  CSV import).

## 2. Color System (Material 3 Implementation)

| Token                            | Hex       | Flutter Usage                        |
| -------------------------------- | --------- | ------------------------------------ |
| `surface`                        | `#F9F9FF` | `ColorScheme.surface`                |
| `surface-container-low`          | `#F1F3FF` | `ColorScheme.surfaceContainerLow`    |
| `surface-container-lowest`       | `#FFFFFF` | `ColorScheme.surfaceContainerLowest` |
| `on_surface` (Primary Text)      | `#141B2B` | `ColorScheme.onSurface`              |
| `on_surface_variant` (Meta Text) | `#3E4947` | `ColorScheme.onSurfaceVariant`       |
| `primary`                        | `#005C55` | `ColorScheme.primary`                |
| `primary_container`              | `#0F766E` | `ColorScheme.primaryContainer`       |

### The "No-Line" Rule

- **Prohibited:** `1px` solid borders for sectioning.
- **Solution:** Define boundaries via background color shifts (e.g., White card
  on `#F1F3FF` base).
- **Fallback:** If a border is absolute necessary for accessibility, use
  `outlineVariant.withOpacity(0.15)`.

## 3. Typography: Manrope Editorial

- **Font Family:** `Manrope`
- **Body Text:** Always use `height: 1.6` for readability.
- **Display Style:** Tight letter-spacing (`-0.02em`) for headlines.
- **Alignment:** Use asymmetrical alignment (e.g., Headline left, stat right)
  for an editorial journal feel.

## 4. Components & Decoration

### The Signature Gradient

```dart
LinearGradient(
  colors: [Color(0xFF005C55), Color(0xFF0F766E)],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
)
```

### Pill Buttons

- Use `StadiumBorder`.
- Primary buttons must use the Signature Gradient.
- Secondary buttons: `surfaceContainerLowest` with no border.

### Sanctuary Cards

- **Radius:** `24.0` (md) or `32.0` (lg).
- **Shadows:** Never use default grey shadows. Use ambient tinted shadows:
  ```dart
  BoxShadow(
    color: Color(0xFF005C55).withValues(alpha: 0.06),
    blurRadius: 40,
    offset: Offset(0, 8),
  )
  ```

### Glassmorphism

- 80% surface opacity + `BackdropFilter` with `Sigma(16, 16)`.

### Icons: Solar Icons

- **Rule:** Never use standard Material `Icons`. Always use the `solar_icons`
  package.
- **Style:**
  - **Inactive/Secondary:** Use `SolarIconsOutline`.
  - **Active/Primary:** Use `SolarIconsBold`.
- **Usage:**
  ```dart
  Icon(SolarIconsOutline.home) // Inactive state
  Icon(SolarIconsBold.home)    // Active state
  ```

## 5. Development Constraints (Linting for Design)

1. **Never** use `Divider()` widgets. Use `SizedBox` for spacing.
2. **Never** use `Colors.black`. Use `Color(0xFF141B2B)`.
3. **Always** use `Material3: true`.
4. **Spacing:** Standardize on an 8pt grid, but favor 24px and 32px for main
   sections.
5. **Componentization:** Always split large pages into smaller, focused widgets.
6. **Icons:** Never use `Icons.xxx`. Always use `SolarIconsOutline.xxx` or
   `SolarIconsBold.xxx`.

## 6. Widget Architecture & Componentization

To maintain code clarity and follow Flutter best practices, follow these
architectural rules:

1. **Split Large Builders**: Never allow a `build` method to exceed 100 lines.
   If it does, split it into private sub-widgets or external component classes.
2. **Atomic Widgets**: Extract reusable UI elements (buttons, cards, inputs)
   into their own files in the `presentation/widgets` directory.
3. **Prefer Classes over Functions**: When splitting a widget, prefer creating a
   separate `StatelessWidget` or `StatefulWidget` class over a helper function
   returning a widget. This allows for better performance (via `const`
   constructors) and cleaner debugging.
4. **Feature-Based Widgets**: Keep widgets that are specific to a single feature
   within that feature's `presentation/widgets` folder.
