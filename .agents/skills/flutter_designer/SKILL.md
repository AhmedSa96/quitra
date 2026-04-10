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

## 5. Development Constraints (Linting for Design)

1. **Never** use `Divider()` widgets. Use `SizedBox` for spacing.
2. **Never** use `Colors.black`. Use `Color(0xFF141B2B)`.
3. **Always** use `Material3: true`.
4. **Spacing:** Standardize on an 8pt grid, but favor 24px and 32px for main
   sections.
