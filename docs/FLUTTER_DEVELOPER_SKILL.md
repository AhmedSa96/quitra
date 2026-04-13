# Quitra Flutter Developer Skill

This document defines the technical architecture and development standards for
the Quitra Flutter app. It mandates a **Clean Architecture** approach using a
modern reactive stack and an **Offline-First** mindset.

## 1. The Stack

- **State Management:** `flutter_bloc` (Separation of UI and Business Logic)
- **Routing:** `go_router` (Declarative routing)
- **DI:** `get_it` + `injectable` (Dependency Injection)
- **Models:** `freezed` + `json_serializable` (Immutable types & boilerplate-free models)
- **Networking:** `supabase_flutter` (Remote)
- **Local Storage:** `isar` (Primary local storage for offline-first data)
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
│       │   │   ├── local/   # Isar implementations
│       │   │   └── remote/  # Supabase implementations
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

- **Models:** Freezed classes with `fromJson`/`toJson`.
- **RemoteDataSources:** API calls to Supabase. Interface-based to allow mocking.
- **LocalDataSources:** Isar database calls. Stores/retrieves local state.
- **Repository Implementations:** The orchestrator of datasources. Implements the **Offline-First** logic.

### Presentation Layer (UI & Logic)

- **Bloc:** Processes Events and emits States. Never holds UI logic.
- **Rule:** UI should only interact with Bloc. No direct Repository calls in Widgets.

## 4. Offline-First Strategy: Optimistic UI

Quitra is an offline-first app. We use an **Optimistic UI** approach for mutations and a **Cache-Fallback** for queries.

### Queries (Reading Data)
1. Repository checks `LocalDataSource`.
2. If data exists, it is returned immediately.
3. Repository may trigger a background sync with `RemoteDataSource` to refresh the `LocalDataSource`.

### Mutations (Writing Data)
1. Repository updates `LocalDataSource` immediately.
2. Repository returns `success` to the Bloc (Optimistic UI).
3. Repository triggers a background push to `RemoteDataSource`.
4. If remote push fails, the Repository manages retry logic or conflict resolution.

## 5. Development Rules & Patterns

### Dependency Injection

Use `@injectable` annotations. Always register implementations against interfaces.

### Error Handling

- Catch `Exceptions` in the Data layer.
- Return `Failures` (e.g., `ServerFailure`, `CacheFailure`) using `Either`.
- **Failures** should be defined in `lib/core/error/failures.dart`.

### Model Generation

Always run: `dart run build_runner build --delete-conflicting-outputs` whenever modifying Freezed/Injectable/Isar files.
