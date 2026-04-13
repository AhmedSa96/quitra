# Quitra

## Project Overview

**Quitra** is a Flutter mobile application designed to help users quit smoking. The app tracks smoking cessation progress, provides onboarding flows, and offers progress visualization and motivational features.

### Architecture

The project follows a **feature-first, clean architecture** approach with BLoC for state management:

```
lib/
├── main.dart              # App entry point
├── core/                  # Shared core utilities
│   ├── di/                # Dependency injection (GetIt + Injectable)
│   ├── error/             # Error handling
│   ├── network/           # Network utilities
│   ├── presentation/      # Shared UI components
│   ├── supabase/          # Supabase client/configuration
│   ├── theme/             # App theming (Material 3, Google Fonts - Manrope)
│   └── app_router.dart    # GoRouter navigation config
├── features/              # Feature modules
│   ├── home/              # Home/dashboard screen
│   ├── journey/           # User journey tracking
│   ├── main/              # Main shell/navigation wrapper
│   ├── onboarding/        # Initial user setup flow
│   ├── progress/          # Progress tracking & visualization
│   ├── settings/          # User settings
│   └── splash/            # Splash/loading screen
└── l10n/                  # Internationalization (ARB files)
```

Each feature module follows a **layered structure**:
```
feature/
├── data/       # Models, datasources, repositories
├── domain/     # Entities, use cases, repository interfaces
└── presentation/ # BLoCs, widgets, pages
```

### Key Technologies

| Category | Technology |
|----------|------------|
| **Framework** | Flutter (Dart SDK ^3.9.0) |
| **State Management** | `flutter_bloc` (BLoC pattern) |
| **Navigation** | `go_router` |
| **Dependency Injection** | `get_it` + `injectable` (codegen) |
| **Local Database** | `isar` (embedded NoSQL database) |
| **Backend** | `supabase_flutter` (auth, database, storage) |
| **HTTP Client** | `dio` |
| **Functional Programming** | `dartz` (Either types, functional error handling) |
| **Serialization** | `freezed` + `json_serializable` |
| **Theming** | Material 3, Google Fonts (Manrope) |
| **i18n** | `flutter_localizations` |

## Building and Running

### Prerequisites

- Flutter SDK (^3.9.0)
- Dart SDK (^3.9.0)
- Supabase CLI (for local backend development)

### Setup

```bash
# Install Flutter dependencies
flutter pub get

# Run code generation (freezed, injectable, isar, json_serializable)
dart run build_runner build --delete-conflicting-outputs

# Start Supabase locally (optional, for backend development)
supabase start
```

### Running the App

```bash
# Run on connected device or emulator
flutter run

# Run on specific platform
flutter run -d android
flutter run -d ios
```

### Building for Production

```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS
flutter build ios --release
```

### Code Generation

The project uses several code generation tools. Re-run generation after modifying annotated files:

```bash
# Watch mode (re-generates on file changes)
dart run build_runner watch --delete-conflicting-outputs

# One-time build
dart run build_runner build --delete-conflicting-outputs
```

Generated files:
- `*.freezed.dart` — Union types, immutable models (Freezed)
- `*.g.dart` — JSON serialization, Isar schemas
- `injection.config.dart` — DI registration (Injectable)

### Testing

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/path/to/test.dart
```

### Linting & Analysis

```bash
# Analyze code for errors/warnings
flutter analyze
```

## Development Conventions

### State Management

- Use **BLoC** (`flutter_bloc`) for all feature state management
- BLoCs are provided via `BlocProvider` at route level (see `app_router.dart`)
- BLoCs are registered in the DI container (`get_it`)

### Dependency Injection

- Uses **GetIt** with **Injectable** for compile-time DI
- Modules are defined with `@module` and `@singleton`/`@injectable` annotations
- Call `configureDependencies()` in `main()` before `runApp()`

### Data Modeling

- Use **Freezed** for immutable union types and data classes
- Use **Isar** for local persistence models (annotated with `@collection`)
- Use **json_serializable** for JSON parsing with Supabase responses

### Error Handling

- Uses **dartz** `Either` type for functional error handling
- Errors flow through domain layer as `Left` values, successes as `Right`

### Theming

- Defined in `lib/core/theme/app_theme.dart`
- Uses **Material 3** with a custom teal/green color palette
- Typography uses **Google Fonts - Manrope**
- Cards have 24px rounded corners, buttons use stadium border

### Internationalization

- ARB files located in `lib/l10n/`
- Template file: `app_en.arb`
- Generated output: `app_localizations.dart`
- Access via `AppLocalizations.of(context)`

### Supabase

- Project ID: `smoke-quit-app`
- Local dev config in `supabase/config.toml`
- Migrations in `supabase/migrations/`
- Auth providers configured: Apple, Google, SMS (Twilio disabled)
- Email signup is **disabled** (SMS signup enabled)

---

## Skills

### flutter_developer

Full technical architecture and development standards. Located at:
- `.agents/skills/flutter_developer/SKILL.md`
- `docs/FLUTTER_DEVELOPER_SKILL.md`

**Key directives:**
- **Stack:** `flutter_bloc`, `go_router`, `get_it` + `injectable`, `freezed` + `json_serializable`, `supabase_flutter`, `isar`, `mocktail` + `bloc_test`
- **Architecture:** Clean Architecture with feature-first modularization (data/domain/presentation layers)
- **Offline-First:** Optimistic UI for mutations, cache-fallback for queries. Local (Isar) → Remote (Supabase) sync pattern
- **State:** Freezed union states (Initial, Loading, Success, Failure). UI only interacts with Bloc, never direct Repository calls
- **Error Handling:** Catch Exceptions in Data layer, return Failures (ServerFailure, CacheFailure) using Either type
- **Codegen:** Always run `dart run build_runner build --delete-conflicting-outputs` after modifying Freezed/Injectable/Isar files

### flutter_designer

Design system implementation guide ("The Serene Path"). Located at:
- `.agents/skills/flutter_designer/SKILL.md`
- `docs/FLUTTER_DESIGNER_SKILL.md`

**Key directives:**
- **Philosophy:** High-end wellness journal — reduce cortisol, reduce task anxiety, editorial clarity
- **Colors:** Material 3 palette (`#F9F9FF` surface, `#005C55` primary, `#0F766E` primaryContainer)
- **No-Line Rule:** No 1px borders for sectioning. Use background color shifts instead
- **Typography:** Manrope font, `height: 1.6` body, `-0.02em` letter-spacing for headlines
- **Cards:** 24px/32px radius, tinted shadows (`Color(0xFF005C55)` at 6% alpha)
- **Icons:** Always use `solar_icons` package — `SolarIconsOutline` (inactive), `SolarIconsBold` (active). Never use Material `Icons`
- **Buttons:** StadiumBorder, signature gradient for primary, `surfaceContainerLowest` for secondary
- **Spacing:** 8pt grid, favor 24px/32px for main sections. Never use `Divider()` — use `SizedBox`
- **Never use `Colors.black`** — use `Color(0xFF141B2B)`
