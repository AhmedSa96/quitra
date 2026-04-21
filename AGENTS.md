# Quitra Development Guide

## Core Principles
- **Strictly Offline:** No external servers or tracking. All data is local via **Isar**.
- **Clean Architecture:** Feature-first structure (Domain, Data, Presentation).
- **The Serene Path:** Design system adherence is mandatory.

## Key Tooling & Commands
- **Code Generation:** Essential for `freezed`, `injectable`, and `isar`.
  - Run: `dart run build_runner build --delete-conflicting-outputs`
- **Linting:** 
  - Run: `flutter analyze`
- **Testing:** Uses `mocktail` and `bloc_test`.

## Architecture Quick-Reference
- **Data Layer:** Models (with `fromJson`/`toJson`) $\rightarrow$ DataSources (Isar) $\rightarrow$ Repository Impls.
- **Domain Layer:** Entities $\rightarrow$ Repository Interfaces $\rightarrow$ Use Cases.
- **Presentation Layer:** Bloc (States/Events) $\rightarrow$ Pages/Widgets.
- **DI:** Uses `get_it` + `injectable`. Always register implementations against interfaces.
- **Error Handling:** Catch `Exceptions` in Data layer $\rightarrow$ Return `Failures` via `Either` (from `dartz`).

## Important Constraints
- **No Direct Repository Calls in UI:** Widgets must only interact with Blocs.
- **Dynamic Computations:** Always use user-configured values (e.g., `cigarettePrice` from `UserProfile`) rather than hardcoded defaults.
- **Data Portability:** Implement CSV export/import in repositories for manual backups.
