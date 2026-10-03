# Multi-Notes Per Day Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Enable users to append multiple timestamped notes throughout the day, while keeping daily smoking/craving metrics updatable for today and preserving read-only historical integrity across Home and Journey pages.

**Architecture:** A new Isar collection `JournalNoteIsar` stores individual append-only notes with timestamps. `DailyLogIsar` remains 1-per-day storing updatable status (`wasSmoked`, `cravingLevel`). Domain entity `JourneyDay` exposes a chronological `List<JourneyNote> notes`. The Home check-in sheet pre-fills today's status and appends new notes. Journey Day Details displays a chronological notes timeline with an inline composer for today only.

**Architecture Diagram:**

```mermaid
graph TD
    subgraph Home Feature
        DCD[DailyCheckInDialog] -->|SaveDailyCheckIn| HB[HomeBloc]
        HB -->|SaveDailyLog| HRepo[HomeRepositoryImpl]
    end

    subgraph Data Layer
        HRepo --> HLDS[HomeLocalDataSourceImpl]
        JRepo[JourneyRepositoryImpl] --> HLDS
        HLDS -->|Upsert| DLI[(DailyLogIsar)]
        HLDS -->|Append| JNI[(JournalNoteIsar)]
    end

    subgraph Journey Feature
        JRepo -->|getJourneyHistory| JB[JourneyBloc]
        JB -->|State with List<JourneyNote>| JP[JourneyPage]
        JB --> JDDP[JourneyDayDetailsPage]
        JDDP -->|AddNote (Today only)| JB
        JB -->|AddJourneyNote| AJN[AddJourneyNoteUseCase]
        AJN --> JRepo
    end
```

**Tech Stack:** Flutter, Dart, Isar, Freezed, BLoC, Injectable, Intl (l10n).

**Spec:** [`docs/superpowers/specs/2026-10-03-multi-notes-per-day-design.md`](file:///Users/ahmedsal/workspace/quitra/docs/superpowers/specs/2026-10-03-multi-notes-per-day-design.md)

## Global Constraints

- Strictly offline: all persistence via local Isar database.
- Clean Architecture: Data -> Domain -> Presentation. No direct repository access from UI widgets.
- Code generation: Must run `dart run build_runner build --delete-conflicting-outputs` after Isar/Freezed changes.
- Linting: Must pass `flutter analyze` with 0 warnings/errors.
- Unit & Widget testing: Use `mocktail` and `bloc_test`.

---

### Task 1: Data Layer — `JournalNoteIsar` Model & Local Data Source Methods

**Files:**
- Create: `lib/features/journey/data/models/journal_note_isar.dart`
- Modify: `lib/features/home/data/datasources/home_local_data_source.dart`
- Test: `test/features/journey/data/datasources/journey_notes_data_source_test.dart`

**Interfaces:**
- Produces: `JournalNoteIsar` class, `HomeLocalDataSource.addJournalNote`, `HomeLocalDataSource.getJournalNotesForDate`, `HomeLocalDataSource.getAllJournalNotes`

- [ ] **Step 1: Write failing data source tests**

Create `test/features/journey/data/datasources/journey_notes_data_source_test.dart`:
```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quitra/features/home/data/datasources/home_local_data_source.dart';
import 'package:quitra/features/journey/data/models/journal_note_isar.dart';

void main() {
  test('JournalNoteIsar has required fields', () {
    final note = JournalNoteIsar()
      ..date = DateTime(2026, 10, 3)
      ..createdAt = DateTime(2026, 10, 3, 14, 30)
      ..text = 'Test reflection';
    expect(note.text, 'Test reflection');
    expect(note.date, DateTime(2026, 10, 3));
    expect(note.createdAt, DateTime(2026, 10, 3, 14, 30));
  });
}
```

- [ ] **Step 2: Run test to verify it fails**

Run: `flutter test test/features/journey/data/datasources/journey_notes_data_source_test.dart`
Expected: Compilation failure (file `journal_note_isar.dart` not found).

- [ ] **Step 3: Create `JournalNoteIsar` model**

Create `lib/features/journey/data/models/journal_note_isar.dart`:
```dart
import 'package:isar/isar.dart';

part 'journal_note_isar.g.dart';

@collection
class JournalNoteIsar {
  Id id = Isar.autoIncrement;

  @Index()
  late DateTime date;

  late DateTime createdAt;

  late String text;
}
```

- [ ] **Step 4: Update `HomeLocalDataSource` interface and implementation**

In `lib/features/home/data/datasources/home_local_data_source.dart`:
Add methods:
```dart
Future<void> addJournalNote(JournalNoteIsar note);
Future<List<JournalNoteIsar>> getJournalNotesForDate(DateTime date);
Future<List<JournalNoteIsar>> getAllJournalNotes();
```
Implement them in `HomeLocalDataSourceImpl` querying `isar.journalNoteIsars`.

- [ ] **Step 5: Run code generation**

Run: `dart run build_runner build --delete-conflicting-outputs`

- [ ] **Step 6: Run tests and verify they pass**

Run: `flutter test test/features/journey/data/datasources/journey_notes_data_source_test.dart`
Expected: PASS

- [ ] **Step 7: Commit**

```bash
git add lib/features/journey/data/models/ lib/features/home/data/datasources/ test/features/journey/
git commit -m "feat(data): add JournalNoteIsar collection and data source queries"
```

---

### Task 2: Domain Layer — `JourneyNote` Entity, `JourneyDay` Update & Repository Implementation

**Files:**
- Create: `lib/features/journey/domain/entities/journey_note.dart`
- Modify: `lib/features/journey/domain/entities/journey_day.dart`
- Create: `lib/features/journey/domain/usecases/add_journey_note.dart`
- Modify: `lib/features/journey/domain/repositories/journey_repository.dart`
- Modify: `lib/features/journey/data/repositories/journey_repository_impl.dart`
- Modify: `lib/features/home/data/repositories/home_repository_impl.dart`
- Test: `test/features/journey/domain/journey_repository_test.dart`

**Interfaces:**
- Produces: `JourneyNote`, `JourneyDay.notes`, `AddJourneyNoteUseCase`

- [ ] **Step 1: Write failing repository test**

In `test/features/journey/domain/journey_repository_test.dart`:
```dart
test('getJourneyHistory maps multiple notes chronologically for the same day', () async {
  // Setup mock localDataSource returning DailyLog and 2 JournalNotes for same date
  // Verify JourneyDay contains 2 JourneyNote instances in sorted order
});
```

- [ ] **Step 2: Run test to verify it fails**

Run: `flutter test test/features/journey/domain/journey_repository_test.dart`
Expected: FAIL

- [ ] **Step 3: Define `JourneyNote` and update `JourneyDay`**

Create `lib/features/journey/domain/entities/journey_note.dart`:
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'journey_note.freezed.dart';

@freezed
class JourneyNote with _$JourneyNote {
  const factory JourneyNote({
    required int id,
    required DateTime createdAt,
    required String text,
  }) = _JourneyNote;
}
```

Update `lib/features/journey/domain/entities/journey_day.dart`:
```dart
@freezed
class JourneyDay with _$JourneyDay {
  const factory JourneyDay({
    required DateTime date,
    required JourneyStatus status,
    @Default([]) List<JourneyNote> notes,
    int? cravingLevel,
  }) = _JourneyDay;
}
```

- [ ] **Step 4: Update Repository and UseCases**

In `JourneyRepositoryImpl`:
Fetch `allJournalNotes = await localDataSource.getAllJournalNotes();`
Group notes by normalized date, map to `JourneyNote`, and sort by `createdAt asc`.

In `HomeRepositoryImpl.saveDailyCheckIn`:
If `note != null && note.trim().isNotEmpty`, instantiate `JournalNoteIsar` and call `localDataSource.addJournalNote(...)`.

Create `AddJourneyNoteUseCase` in `lib/features/journey/domain/usecases/add_journey_note.dart`.

- [ ] **Step 5: Run code generation & tests**

Run: `dart run build_runner build --delete-conflicting-outputs`
Run: `flutter test test/features/journey/`
Expected: PASS

- [ ] **Step 6: Commit**

```bash
git add lib/features/journey/ lib/features/home/data/ test/features/journey/
git commit -m "feat(domain): integrate JourneyNote into JourneyDay and repository"
```

---

### Task 3: Home Feature — `DailyCheckInDialog` Status Pre-fill & Note Appending

**Files:**
- Modify: `lib/l10n/app_en.arb`, `lib/l10n/app_ar.arb`, `lib/l10n/app_tr.arb`
- Modify: `lib/features/home/presentation/widgets/daily_check_in_dialog.dart`
- Modify: `lib/features/home/presentation/bloc/home_bloc.dart`
- Test: `test/features/home/presentation/widgets/daily_check_in_dialog_test.dart`

- [ ] **Step 1: Update localization ARB files and generate strings**

Add keys in `app_en.arb`:
```json
"notesCount": "{count, plural, =1{1 note} other{{count} notes}}",
"addNoteHint": "Add a reflection or thought...",
"notesLoggedToday": "{count, plural, =1{1 note logged today} other{{count} notes logged today}}"
```
Add Arabic (`app_ar.arb`) and Turkish (`app_tr.arb`) equivalents.
Run: `flutter gen-l10n`

- [ ] **Step 2: Write failing widget test for DailyCheckInDialog pre-fill**

Verify that if a daily log exists for today, `_wasSmoked` and `_cravingLevel` reflect that log.

- [ ] **Step 3: Update `DailyCheckInDialog`**

- Fetch today's log/notes count in `initState` or from `HomeBloc`.
- Pre-populate `_wasSmoked` and `_cravingLevel`.
- Keep note field empty with hint `l10n.addNoteHint`.
- Show subtle pill if `notesToday > 0`: `l10n.notesLoggedToday(count)`.
- On submit: call `HomeEvent.saveDailyCheckIn`.

- [ ] **Step 4: Run tests**

Run: `flutter test test/features/home/`
Expected: PASS

- [ ] **Step 5: Commit**

```bash
git add lib/l10n/ lib/features/home/ test/features/home/
git commit -m "feat(home): pre-fill today's status and support multi-note appends in check-in"
```

---

### Task 4: Journey Feature — Timeline Note Badges & Day Details Chronological Notes List

**Files:**
- Modify: `lib/features/journey/presentation/widgets/journey_timeline_item.dart`
- Create: `lib/features/journey/presentation/widgets/journey_day_notes_list.dart`
- Modify: `lib/features/journey/presentation/pages/journey_day_details_page.dart`
- Modify: `lib/features/journey/presentation/bloc/journey_bloc.dart` & `journey_event.dart`
- Test: `test/features/journey/presentation/pages/journey_day_details_page_test.dart`

- [ ] **Step 1: Write failing widget test for `JourneyDayDetailsPage`**

Test that:
- Past days do not display the "Add Note" composer.
- Today displays the "Add Note" composer.
- All notes in `day.notes` are rendered with time formatting.

- [ ] **Step 2: Update `JourneyTimelineItem`**

- If `day.notes.isNotEmpty`:
  - Show note badge with count: `💬 ${day.notes.length}`
  - Show the latest note's text excerpt in italic caption.

- [ ] **Step 3: Create `JourneyDayNotesList` & update `JourneyDayDetailsPage`**

- Display notes chronologically with time tags (`DateFormat.jm()`).
- If `isToday == true`: provide an input field with "Add Note" action calling `JourneyBloc.add(JourneyEvent.addNote(text))`.
- If past day: read-only timeline.
- Replace old `JourneyDayNoteCard`.

- [ ] **Step 4: Run tests and analyze**

Run: `flutter test`
Run: `flutter analyze`
Expected: 0 errors, 0 warnings, all tests PASS.

- [ ] **Step 5: Commit**

```bash
git add lib/features/journey/ test/features/journey/
git commit -m "feat(journey): add chronological notes list and today-only note composer"
```
