# Quitra Flutter Developer Skill

This document defines the technical architecture and development standards for the Quitra Flutter app. It mandates a **Clean Architecture** approach using a modern reactive stack.

## 1. The Stack
- **State Management:** `flutter_bloc` (Separation of UI and Business Logic)
- **Routing:** `go_router` (Declarative routing)
- **DI:** `get_it` + `injectable` (Dependency Injection)
- **Models:** `freezed` + `json_serializable` (Immutable types & boilerplate-free models)
- **Networking:** `dio` + `retrofit` (Type-safe API clients)
- **Testing:** `mocktail` + `bloc_test`

## 2. Directory Structure (Clean Architecture)
Follow this feature-first nesting:

```text
lib/
├── core/                # Global utilities, theme, and common widgets
│   ├── theme/
│   ├── network/
│   ├── error/           # Global Failures & Exceptions
│   └── di/              # Injection container setup
├── features/            # Feature-based modularization
│   └── smoking_stats/   # Example Feature
│       ├── data/
│       │   ├── datasources/
│       │   ├── models/
│       │   └── repositories_impl/
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/ # Interfaces
│       │   └── usecases/
│       └── presentation/
│           ├── bloc/
│           ├── pages/
│           └── widgets/
└── main.dart
```

## 3. Layer Responsibilities

### Domain Layer (Independent)
- **Entities:** Plain Dart classes (or Freezed) representing the business model. No JSON/external logic.
- **Repositories (Interfaces):** Contract defining what data is needed, not how it's fetched.
- **Use Cases:** Atomic business logic (e.g., `CalculateDaysSmokeFree`).

### Data Layer (Implementation)
- **Models:** Freezed classes with `fromJson`/`toJson`.
- **DataSources:** Raw API or Local DB calls (Dio/Isar/Hive).
- **Repository Implementations:** Logic to fetch from data source and convert Models back to Entities.

### Presentation Layer (UI & Logic)
- **Bloc:** Processes Events and emits States. Never holds UI logic.
- **Pages:** Feature entry points.
- **Widgets:** Reusable leaf components.

## 4. Development Rules & Patterns

### Dependency Injection
Use `@injectable` annotations for automatic registration.
```dart
@lazySingleton
class GetSmokingStatsUseCase { ... }
```

### Routing
Define routes in `lib/core/app_router.dart`. Use named routes or Typed Routes.

### State Management (Bloc)
- **States:** Always use Freezed for Union states (Initial, Loading, Success, Failure).
- **Events:** Use specific events for user actions.
- **Rule:** UI should only interact with Bloc. No direct Repository calls in Widgets.

### Error Handling
Catch `Exceptions` in the Data layer and return `Failures` (Either type or Result type) to the Domain/Presentation layer.

### Model Generation
Always run:
`dart run build_runner build --delete-conflicting-outputs`
whenever modifying Freezed/Injectable files.
