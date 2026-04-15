# Quitra Flutter Developer Skill

This document defines the technical architecture and development standards for
the Quitra Flutter app. It mandates a **Clean Architecture** approach using a
modern reactive stack and an **Offline-First** mindset.

## 1. The Stack

- **State Management:** `flutter_bloc`
- **Routing:** `go_router`
- **DI:** `get_it` + `injectable`
- **Models:** `freezed` + `json_serializable`
- **Local Storage:** `isar` (Primary and only storage)
- **Data Portability:** `csv` (For manual import/export)
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
│   └── smoking_stats/
│       ├── data/
│       │   ├── datasources/ # Isar implementations
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
- **Use Cases:** Atomic business logic.

### Data Layer (Implementation)

- **Models:** Freezed classes with `fromJson`/`toJson` (for CSV/JSON serialization).
- **DataSources:** Isar database calls. Stores/retrieves local state.
- **Repository Implementations:** The orchestrator of data. Implements the business logic for state persistence.

### Presentation Layer (UI & Logic)

- **Bloc:** Processes Events and emits States. Never holds UI logic.
- **Rule:** UI should only interact with Bloc. No direct Repository calls in Widgets.

### Dynamic Computations

- When computing stats (e.g., money saved), DO NOT use hardcoded values. Always fetch the user's custom pricing from the `UserProfile` (e.g., `cigarettePrice` or compute from `packetPrice` and `cigarettesPerPacket`).

## 4. Local-First Architecture

Quitra is a strictly offline app. Data persistence is immediate and local.

### Data Portability (CSV)
1. **Export:** Repositories must provide methods to serialize Isar collections into CSV strings for file export.
2. **Import:** Repositories must handle CSV parsing and batch-inserting into Isar while maintaining data integrity.

## 5. Development Rules & Patterns

### Dependency Injection

Use `@injectable` annotations. Always register implementations against interfaces.

### Error Handling

- Catch `Exceptions` in the Data layer.
- Return `Failures` (e.g., `DatabaseFailure`, `FileFailure`) using `Either`.
- **Failures** should be defined in `lib/core/error/failures.dart`.

### Model Generation

Always run: `dart run build_runner build --delete-conflicting-outputs` whenever modifying Freezed/Injectable/Isar files.
