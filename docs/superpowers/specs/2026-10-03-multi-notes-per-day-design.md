# Multi-Notes Per Day Design Specification

## Overview
This specification details the architecture, data models, domain logic, and user interaction flows for supporting multiple timestamped notes per day in Quitra across the **Home** (Daily Check-in) and **Journey** (Timeline & Day Details) features.

---

## 1. Requirements & Core Principles

1. **Append-Only Notes**:
   - Notes cannot be edited or overwritten.
   - Each note is an immutable entry with its own unique ID, exact creation timestamp (`createdAt`), and text content.
   - Users can record multiple notes on the same day.
2. **Updatable Craving & Smoking Status**:
   - The overall daily status (`wasSmoked`, `cravingLevel`) remains singular per day.
   - Submitting a new check-in or updating the day's status replaces/updates the day's metrics rather than creating duplicate daily status rows.
3. **Strict Today-Only Mutation**:
   - Users can only append notes and update status/craving for **Today**.
   - Historical entries (past days) in Journey are strictly read-only to preserve authenticity.
4. **Offline-First & Clean Architecture**:
   - All data is persisted locally in Isar.
   - Changes follow strict Clean Architecture layer separation: Data (Models & DataSources) -> Domain (Entities, Repositories, UseCases) -> Presentation (Blocs & Widgets).

---

## 2. Architecture & Data Layer

### 2.1 Isar Data Models

#### `DailyLogIsar` (`lib/features/home/data/models/daily_log_isar.dart`)
Stores daily summary metrics.
- `id`: `Id` (auto-increment)
- `date`: `DateTime` normalized to midnight (`DateTime(year, month, day)`), indexed with `@Index(unique: true, replace: true)`
- `wasSmoked`: `bool` (default: `false`)
- `cravingLevel`: `int` (1–5 scale)
- `note`: `String?` (deprecated, retained for migration/legacy fallback)

#### `JournalNoteIsar` (`lib/features/journey/data/models/journal_note_isar.dart`)
Stores individual notes.
- `id`: `Id` (auto-increment)
- `date`: `DateTime` (normalized to midnight) with `@Index()` for fast retrieval by date range
- `createdAt`: `DateTime` (exact timestamp of note submission)
- `text`: `String`

### 2.2 Data Source & Repositories

#### `HomeLocalDataSource` / `JourneyLocalDataSource`
- `saveDailyCheckIn({required bool wasSmoked, required int cravingLevel, String? note})`:
  - Upserts `DailyLogIsar` for normalized today.
  - If `note != null && note.trim().isNotEmpty`, inserts a new `JournalNoteIsar` record with `date: normalizedToday`, `createdAt: DateTime.now()`, `text: note.trim()`.
- `getJournalNotesForDate(DateTime date)`:
  - Queries `isar.journalNoteIsars.filter().dateEqualTo(normalizedDate).sortByCreatedAt().findAll()`.
- `addJournalNote({required DateTime date, required String text})`:
  - Inserts a new `JournalNoteIsar`.

---

## 3. Domain Layer

### 3.1 Entities

#### `JourneyNote` (`lib/features/journey/domain/entities/journey_note.dart`)
```dart
@freezed
class JourneyNote with _$JourneyNote {
  const factory JourneyNote({
    required int id,
    required DateTime createdAt,
    required String text,
  }) = _JourneyNote;
}
```

#### `JourneyDay` (`lib/features/journey/domain/entities/journey_day.dart`)
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

### 3.2 Use Cases
- **`SaveDailyLog` (or `SaveDailyCheckInUseCase`)**:
  - Accepts `wasSmoked`, `cravingLevel`, and optional `note`.
  - Upserts daily log and appends note if present.
- **`AddJourneyNoteUseCase`**:
  - Accepts `text`.
  - Appends a new note for `DateTime.now()` (Today only).
- **`UpdateJourneyDayUseCase`**:
  - Updates `wasSmoked` and `cravingLevel` for a given day (validated to Today only).

---

## 4. Presentation & User Experience

### 4.1 Home Page: `DailyCheckInDialog`
- **Initial State**:
  - Checks if a `DailyLogIsar` already exists for today.
  - If it exists, pre-fills `_wasSmoked` switch and `_cravingLevel` slider with today's saved values.
  - Note text field is blank, allowing user to write a new reflection.
  - If notes already exist for today, displays an indicator: *"X notes recorded today"*.
- **On Submit**:
  - Emits `HomeEvent.saveDailyCheckIn`.
  - Updates daily metrics and appends new note if provided.

### 4.2 Journey Timeline: `JourneyPage` & `JourneyTimelineItem`
- Each timeline day displays:
  - Day status icon (Clean / Craving / Setback) and localized date.
  - If `day.notes.isNotEmpty`:
    - Note count pill (e.g. `💬 2`).
    - Excerpt of the latest note in subtle italic text.
  - Tapping opens `JourneyDayDetailsPage`.

### 4.3 Journey Day Details: `JourneyDayDetailsPage`
- **Status Card (`JourneyDayStatusCard`)**:
  - Shows `wasSmoked` switch and `cravingLevel` slider.
  - Interactive **only when `isToday == true`**; static/read-only for past dates.
- **Notes List (`JourneyDayNotesList`)**:
  - Chronological list of `JourneyNote` items.
  - Each item displays:
    - Formatted time badge (e.g. `09:15 AM`).
    - Note body text in a serene card container.
  - When `isToday == true`:
    - Includes an "Add Note" input field + submit button at the bottom of the list.
  - When `isToday == false`:
    - Composer is hidden; notes are strictly read-only.
- **Share Card**:
  - Displays smoke-free days and latest reflection summary.

---

## 5. Localization (l10n)
Add entries to `app_en.arb`, `app_ar.arb`, and `app_tr.arb`:
- `notesCount`: "{count, plural, =1{1 note} other{{count} notes}}"
- `addNoteHint`: "Write a reflection or thought..."
- `addNoteAction`: "Add Note"
- `todayNotesTitle`: "Today's Reflections"
- `noNotesRecorded`: "No notes recorded for this day."

---

## 6. Testing & Quality Assurance
- **Unit Tests**:
  - `JourneyRepositoryImpl`: Verify multi-note mapping and chronological sorting.
  - `HomeRepositoryImpl`: Verify that multiple check-in calls append notes while updating metrics.
  - Use cases: test `AddJourneyNoteUseCase` rejects past dates.
- **Bloc Tests**:
  - `JourneyBloc`: Test adding a note updates state with the new note appended.
  - `HomeBloc`: Test check-in saves metrics and note correctly.
- **Widget Tests**:
  - Verify composer appears only on Today in `JourneyDayDetailsPage`.
  - Verify timeline item displays note count and excerpt.
