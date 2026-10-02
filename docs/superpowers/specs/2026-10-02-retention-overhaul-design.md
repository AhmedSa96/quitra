# Quitra Retention Overhaul — Design Specification

> **Date:** 2026-10-02
> **Status:** Approved
> **Scope:** 6 interconnected features that transform Quitra's retention and engagement

---

## Overview

This spec describes a cohesive overhaul to improve user retention in Quitra. The changes are ordered by dependency and priority:

1. **Streak System** — new domain logic, the foundation for everything else
2. **Home Page Redesign** — streak counter + heatmap hero, restructured layout
3. **Milestones** — auto-awarded, brand-aligned progress markers
4. **Smart Notifications** — context-aware, compassionate notification triggers
5. **Targeted Animations** — subtle state-communicating animations
6. **Progress Page Improvements** — weekly trend, milestones section, l10n fixes

All features follow:
- The **Serene Path** design system ([DESIGN.md](file:///Users/ahmedsal/workspace/quitra/docs/DESIGN.md))
- The **Quitra brand identity** ([brand.md](file:///Users/ahmedsal/workspace/quitra/docs/brand.md))
- **Clean Architecture** (domain → data → presentation)
- **Strictly offline** (Isar, no external services)

---

## 1. Streak System

### Domain Layer

**Entity: `Streak`**
```dart
@freezed
abstract class Streak with _$Streak {
  const factory Streak({
    required int currentCount,
    required int longestCount,
    required DateTime? lastCheckInDate,
    required StreakMode mode,
    @Default(false) bool forgivenessUsedThisWeek,
  }) = _Streak;
}

enum StreakMode { strict, forgiving }
```

**Streak rules:**
- **Incrementing:** Streak increments when a daily check-in is completed AND the user reports no smoking that day.
- **Strict mode:** Any reported smoking resets `currentCount` to 0.
- **Forgiving mode:** One smoking report per calendar week is forgiven — the streak continues but `forgivenessUsedThisWeek` is set to true. A second smoking report in the same week resets the streak. Resets at the start of each new week (Monday).
- **Missed check-in:** If a day passes with no check-in, the streak does NOT automatically break. Only an explicit smoking report breaks it. This avoids punishing users who simply forgot to open the app — compassion over discipline.
- `longestCount` is updated whenever `currentCount` exceeds it.

**Repository Interface: `StreakRepository`**
```dart
abstract class StreakRepository {
  Future<Either<Failure, Streak>> getStreak();
  Future<Either<Failure, Streak>> incrementStreak();
  Future<Either<Failure, Streak>> resetStreak();
  Future<Either<Failure, Streak>> updateStreakMode(StreakMode mode);
  Future<Either<Failure, Streak>> useForgivenessToken();
}
```

**Use Cases:**
- `GetStreak` — loads current streak for display
- `IncrementStreak` — called after successful smoke-free check-in
- `ResetStreak` — called when a relapse breaks the streak (considering mode)
- `UpdateStreakMode` — toggles strict/forgiving from settings
- `ProcessCheckIn` — orchestrates: check if smoking → if yes, evaluate mode → either forgive or reset; if no → increment

### Data Layer

**Isar Model: `StreakModel`**
- Maps to `Streak` entity
- Fields: `currentCount`, `longestCount`, `lastCheckInDate`, `modeIndex`, `forgivenessUsedThisWeek`, `weekStartDate`

**Data Source: `StreakLocalDataSource`**
- CRUD operations on Isar `StreakModel`
- Initialize with default streak (0, 0, null, strict, false) on first launch

### Settings Integration

- Add "Streak Mode" option in Settings page under a new "Streak" group
- Two options: "Strict" (default) and "Forgiving (1 free pass per week)"
- Uses `UpdateStreakMode` use case

---

## 2. Home Page Redesign

### Current Structure (to be replaced)
```
HomePage
├── HomeHeader          (greeting: "Day X")
├── HomeActionSection   (craving pill button)
├── HomeStatsBar        (money, cigs, time row)
└── DailyCheckInCard    (check-in prompt)
```

### New Structure
```
HomePage
├── HomeHeader            (greeting: "Day X" + motivational subtitle)
├── StreakHeroCard         (NEW — streak counter + heatmap + stats)
│   ├── StreakCounter      (large "23 🔥" in teal)
│   ├── HeatmapGrid       (GitHub-style grid, last 12 weeks)
│   └── QuickStatsRow     (money, cigs, time — moved from HomeStatsBar)
├── HomeActionSection     (craving pill button — keep as-is)
└── DailyCheckInCard      (check-in prompt — keep as-is)
```

### Widget: `StreakHeroCard`

Wraps in a `SanctuaryCard` or equivalent surface-container-low card (matching design system — no borders, 24px radius).

**StreakCounter:**
- Large streak number in `displayLarge` style using `AppTheme.primary` color
- Small flame emoji next to the number (using Unicode, not an image — keeps it offline)
- If streak is 0, show "Start your streak" in `bodyLarge` with `onSurfaceVariant` color

**HeatmapGrid:**
- Renders a grid of small rounded squares (8x8px with 3px gap, 4px radius)
- Data source: reads `JourneyDay` history from the `JourneyRepository`
- Shows last 12 calendar weeks, flowing left-to-right, newest week on right
- Day-of-week labels on left: M, W, F (in `labelMedium`)
- Color mapping:
  - Clean day within streak: `AppTheme.primary` (deep teal)
  - Clean day, no streak: `AppTheme.primaryContainer` (medium teal)
  - Setback day: Warm terracotta `Color(0xFFE57373)` (from existing health milestone palette)
  - No data / future: `AppTheme.surfaceContainerLow`

**QuickStatsRow:**
- Three `StatItem` widgets in a `Row` (reuses existing shared widget from `core/presentation/widgets/stat_item.dart`)
- Displays: money saved, cigs avoided, days smoke-free
- Uses l10n for labels

### Files Changed
- **New:** `lib/features/home/presentation/widgets/streak_hero_card.dart`
- **New:** `lib/features/home/presentation/widgets/heatmap_grid.dart`
- **Modified:** `lib/features/home/presentation/pages/home_page.dart` — replace widget list
- **Modified:** `lib/features/home/presentation/widgets/home_header.dart` — minor text update
- **Deleted:** `lib/features/home/presentation/widgets/home_stats_bar.dart`

### HomeBloc Changes
- `HomeState.loaded` needs new field: `streak` (Streak entity)
- `HomeEvent` needs: `loadStats` (existing, now also loads streak), `checkIn` (triggers streak logic)
- HomeBloc depends on `GetStreak` use case in addition to existing use cases

---

## 3. Milestones

### Domain Layer

**Entity: `Milestone`**
```dart
@freezed
abstract class Milestone with _$Milestone {
  const factory Milestone({
    required String id,
    required String titleKey,     // l10n key for the title
    required String descriptionKey, // l10n key for the description
    required MilestoneCategory category,
    required String iconName,     // SolarIcons identifier
    required double threshold,    // numeric threshold to unlock
    required bool isUnlocked,
    DateTime? unlockedAt,
  }) = _Milestone;
}

enum MilestoneCategory {
  time,          // Time-based: 1 day, 1 week, 1 month, etc.
  healthRecovery, // Health: heart, lungs, circulation
  savings,       // Financial: $10, $50, $100, etc.
  consistency,   // Streak: 7-day, 30-day, 100-day
  strength,      // Craving moments passed: 1, 10, 50
  dedication,    // Check-in consistency: 7, 30 check-ins
}
```

**Pre-defined Milestones (hardcoded list):**

| ID | Category | Threshold | Title Key (l10n) |
|---|---|---|---|
| `time_1d` | time | 1 | `milestoneFirstDay` |
| `time_3d` | time | 3 | `milestoneThreeDays` |
| `time_1w` | time | 7 | `milestoneOneWeek` |
| `time_2w` | time | 14 | `milestoneTwoWeeks` |
| `time_1m` | time | 30 | `milestoneOneMonth` |
| `time_3m` | time | 90 | `milestoneThreeMonths` |
| `time_6m` | time | 180 | `milestoneSixMonths` |
| `time_1y` | time | 365 | `milestoneOneYear` |
| `health_heart` | healthRecovery | 1.0 | `milestoneHeartHealing` |
| `health_circulation` | healthRecovery | 0.5 | `milestoneCirculationImproved` |
| `health_lungs` | healthRecovery | 0.5 | `milestoneBreathingEasier` |
| `savings_10` | savings | 10 | `milestoneSaved10` |
| `savings_50` | savings | 50 | `milestoneSaved50` |
| `savings_100` | savings | 100 | `milestoneSaved100` |
| `savings_500` | savings | 500 | `milestoneSaved500` |
| `streak_7` | consistency | 7 | `milestoneStreak7` |
| `streak_30` | consistency | 30 | `milestoneStreak30` |
| `streak_100` | consistency | 100 | `milestoneStreak100` |
| `strength_1` | strength | 1 | `milestoneFirstMomentPassed` |
| `strength_10` | strength | 10 | `milestoneTenMomentsPassed` |
| `strength_50` | strength | 50 | `milestoneFiftyMomentsPassed` |
| `dedication_7` | dedication | 7 | `milestoneSevenCheckIns` |
| `dedication_30` | dedication | 30 | `milestoneThirtyCheckIns` |

**Repository Interface: `MilestoneRepository`**
```dart
abstract class MilestoneRepository {
  Future<Either<Failure, List<Milestone>>> getAllMilestones();
  Future<Either<Failure, List<Milestone>>> getUnlockedMilestones();
  Future<Either<Failure, Milestone>> unlockMilestone(String id);
  Future<Either<Failure, List<Milestone>>> checkAndUnlockMilestones({
    required int daysSmokeFree,
    required double moneySaved,
    required int currentStreak,
    required int cravingsResisted,
    required int totalCheckIns,
    required double heartProgress,
    required double circulationProgress,
    required double lungProgress,
  });
}
```

**Use Case: `CheckMilestones`**
- Called after: check-in, craving log, streak update
- Compares current stats against all milestone thresholds
- Returns list of newly unlocked milestones

### Data Layer

**Isar Model: `MilestoneModel`**
- Fields: `milestoneId` (string), `isUnlocked` (bool), `unlockedAt` (DateTime?)
- Only stores unlock state — the milestone definitions are hardcoded

### Presentation

**Unlock Celebration:**
- Subtle bottom sheet, not a dialog
- Shows milestone icon + title + compassionate description
- Background: `AppTheme.surfaceContainerLowest` (pure white)
- Accent: soft green (`Color(0xFF22C55E)`) for the icon glow
- Auto-dismisses after 4 seconds or on tap/swipe
- Haptic feedback: light impact

**Progress Page — `MilestonesSection` Widget:**
- Title: "Your Milestones" (l10n)
- Horizontal scrollable row of milestone cards
- Each card: icon + title + locked/unlocked visual state
- Unlocked: full color icon, title in `onSurface`
- Locked: icon and title at 40% opacity, soft `surfaceContainerLow` overlay
- Shows categories: time, health, savings, consistency
- Filtered by category with small pill chips at the top

**Journey Page — `JourneyMilestonesSection` Widget:**
- Same card style as above
- Shows categories: strength (moments passed), dedication (check-ins)
- Placed above the journey timeline

---

## 4. Smart Notifications

### Notification Triggers

**1. Streak-at-Risk Reminder**
- **Condition:** No check-in recorded today AND it's past 8:00 PM local time
- **Title:** `streakAtRiskTitle` → "Don't forget to check in"
- **Body:** `streakAtRiskBody` → "Your {X}-day streak matters. Take a moment to check in."
- **Schedule:** Daily at 8:00 PM, cancelled if check-in already done
- **Setting toggle:** "Streak reminders" (default: on)

**2. Milestone Celebration**
- **Condition:** A new milestone was just unlocked
- **Title:** Dynamic based on milestone: e.g., "One Week ✓"
- **Body:** Dynamic: e.g., "You made it to one week. That's real progress."
- **Schedule:** Immediate (when milestone is detected)
- **Setting toggle:** "Milestone celebrations" (existing, keep)

**3. Morning Encouragement (Improved Daily Reminder)**
- **Condition:** Existing daily reminder, improved copy
- **Title:** `dailyEncouragementTitle` → "Day {X}"
- **Body:** `dailyEncouragementBody` → "You're still here. That matters."
- **Schedule:** User-configured time (existing time picker)
- **Setting toggle:** Existing "Daily reminder" toggle

**4. Smart Craving Support**
- **Condition:** User has 7+ days of craving log data AND a detectable pattern (2+ cravings logged within the same 2-hour window across different days)
- **Title:** `cravingSupportTitle` → "You've got this"
- **Body:** `cravingSupportBody` → "You usually feel it around this time. You've made it through before."
- **Schedule:** 15 minutes before the detected high-craving window
- **Setting toggle:** "Smart support" (default: off until sufficient data, auto-suggest enabling once pattern detected)

### Architecture

**Service: `NotificationTriggerService`**
```dart
@injectable
class NotificationTriggerService {
  // Called after check-in to reschedule/cancel streak-at-risk
  Future<void> evaluateStreakReminder(Streak streak, bool checkedInToday);

  // Called after milestone unlock
  Future<void> fireMilestoneNotification(Milestone milestone);

  // Called after craving log to re-evaluate pattern
  Future<void> evaluateCravingPattern(List<CravingLog> recentCravings);

  // Called on app launch to schedule daily encouragement
  Future<void> scheduleDailyEncouragement(TimeOfDay time, int dayCount);
}
```

- Uses existing `flutter_local_notifications` package
- All notification content uses l10n keys for localization
- Notification IDs: deterministic (streak=1, milestone=2xx, daily=3, craving=4)

### Settings Page Updates

New `SettingsGroup` in `NotificationsPage`:
```
Streak & Smart Notifications
├── Streak reminders (toggle, default: on)
├── Smart support (toggle, default: off)
│   └── (shows "Available after 7 days of data" hint when off + insufficient data)
```

Keep existing groups unchanged.

---

## 5. Targeted Animations

### Animation Inventory

| Element | Type | Duration | Curve | Trigger |
|---|---|---|---|---|
| Streak counter number | Scale 0.9→1.0 + opacity 0→1 | 600ms | `Curves.easeOutBack` | Home page load / streak increment |
| Heatmap squares | Staggered opacity 0→1, left-to-right | 50ms interval per column, 300ms per square | `Curves.easeOut` | Home page first load |
| Health milestone progress bars | Width 0→target | 800ms | `Curves.easeOutCubic` | Progress page load |
| Craving resist success | Green ripple outward from button | 500ms | `Curves.easeOut` | User reports "I resisted" |
| Milestone unlock bottom sheet | SlideTransition bottom→up + scale-in icon | 400ms | `Curves.easeOutCubic` | Milestone unlocked |
| Quick stats numbers | Count-up from 0 to value | 1000ms | `Curves.easeOut` | Home page load |
| Tab transitions | FadeTransition between IndexedStack children | 200ms | `Curves.easeInOut` | Tab switch |

### Implementation Approach

- All animations use Flutter's built-in animation framework
- `AnimationController` + `CurvedAnimation` for complex sequences
- `TweenAnimationBuilder` for simple one-shot animations
- `AnimatedContainer` / `AnimatedOpacity` for property changes
- No external animation packages (no Lottie, no Rive)
- Respect system accessibility: check `MediaQuery.of(context).disableAnimations` and skip animations when reduced motion is enabled

### What NOT to Animate
- Navigation bar icons — no bouncing, wiggling, or scaling
- Card appearances on scroll — no slide-in-from-side effects
- Background elements — no ambient particles or gradient shifts

---

## 6. Progress Page Improvements

### Layout Reorder

**Current:**
```
ProgressHeader
HealthMilestonesSection
DetailedInsightsSection
```

**New:**
```
ProgressHeader
WeeklyTrendSection       (NEW)
HealthMilestonesSection   (existing, l10n fixed)
MilestonesSection         (NEW, from Section 3)
DetailedInsightsSection   (existing, l10n fixed)
```

### New Widget: `WeeklyTrendSection`

- Title: "This Week" (l10n: `thisWeekTitle`)
- 7 vertical bars representing craving count per day (Mon-Sun)
- Bar height proportional to max cravings that week
- Bar color: `AppTheme.primary` at varying opacity (more cravings = more opaque)
- Day labels below each bar: M, T, W, T, F, S, S
- If a day has 0 cravings, show a tiny dot instead of a bar
- Today's bar has a subtle glow ring around it

**Implementation:** `CustomPainter` — no chart library dependency. Simple rounded rectangles.

**Data source:** Query `CravingLog` entries from the last 7 days, group by day-of-week, count per day.

### l10n Fixes

**In `health_milestones_section.dart`:**
- `'Health Milestones'` → `l10n.healthMilestonesTitle`

**In `detailed_insights_section.dart`:**
- `'Detailed Insights'` → `l10n.detailedInsightsTitle`
- `'Money Saved'` → `l10n.moneySavedLabel`
- `'Cigarettes Avoided'` → `l10n.cigarettesAvoidedLabel`
- `'Life Regained'` → `l10n.lifeRegainedLabel`
- `'Clean Streak'` → `l10n.yourStreakLabel` (brand-aligned: "Your Streak" not "Clean Streak")

### Journey Page Updates

- Add `JourneyMilestonesSection` above the existing journey timeline
- Shows strength + dedication category milestones
- Same visual style as Progress page milestones

---

## Data Flow Summary

```
User Check-In (DailyCheckInDialog)
  │
  ├── HomeBloc.checkIn()
  │     ├── ProcessCheckIn use case
  │     │     ├── If smoke-free → IncrementStreak
  │     │     └── If smoked → evaluate mode → ResetStreak or UseForgivenessToken
  │     │
  │     ├── CheckMilestones use case (with updated stats)
  │     │     └── Returns newly unlocked milestones → show bottom sheet
  │     │
  │     └── Reload HomeState (streak, stats, heatmap data)
  │
  ├── NotificationTriggerService.evaluateStreakReminder()
  │     └── Cancel tonight's streak-at-risk notification
  │
  └── NotificationTriggerService.evaluateCravingPattern()
        └── Reschedule smart support notification if pattern detected

User Logs Craving (CravingOutcomeDialog)
  │
  ├── HomeBloc.logCraving()
  │     ├── If resisted → CheckMilestones (strength category)
  │     └── If smoked → ProcessCheckIn logic (streak evaluation)
  │
  └── NotificationTriggerService.evaluateCravingPattern()
```

---

## File Impact Summary

### New Files (24 files)
| File | Purpose |
|---|---|
| `lib/features/home/presentation/widgets/streak_hero_card.dart` | Streak counter + heatmap + stats card |
| `lib/features/home/presentation/widgets/heatmap_grid.dart` | GitHub-style contribution heatmap widget |
| `lib/features/streak/domain/entities/streak.dart` | Streak entity + StreakMode enum |
| `lib/features/streak/domain/repositories/streak_repository.dart` | Repository interface |
| `lib/features/streak/domain/usecases/get_streak.dart` | Get streak use case |
| `lib/features/streak/domain/usecases/increment_streak.dart` | Increment use case |
| `lib/features/streak/domain/usecases/reset_streak.dart` | Reset use case |
| `lib/features/streak/domain/usecases/update_streak_mode.dart` | Mode toggle use case |
| `lib/features/streak/domain/usecases/process_check_in.dart` | Orchestrator use case |
| `lib/features/streak/data/models/streak_model.dart` | Isar model |
| `lib/features/streak/data/datasources/streak_local_data_source.dart` | Isar data source |
| `lib/features/streak/data/repositories/streak_repository_impl.dart` | Repository implementation |
| `lib/features/milestones/domain/entities/milestone.dart` | Milestone entity |
| `lib/features/milestones/domain/repositories/milestone_repository.dart` | Repository interface |
| `lib/features/milestones/domain/usecases/check_milestones.dart` | Check & unlock use case |
| `lib/features/milestones/data/models/milestone_model.dart` | Isar model (unlock state) |
| `lib/features/milestones/data/datasources/milestone_local_data_source.dart` | Isar data source |
| `lib/features/milestones/data/repositories/milestone_repository_impl.dart` | Repository implementation |
| `lib/features/milestones/data/milestone_definitions.dart` | Hardcoded milestone list |
| `lib/features/milestones/presentation/widgets/milestones_section.dart` | Horizontal scrollable milestones |
| `lib/features/milestones/presentation/widgets/milestone_card.dart` | Individual milestone card |
| `lib/features/milestones/presentation/widgets/milestone_unlock_sheet.dart` | Celebration bottom sheet |
| `lib/features/progress/presentation/widgets/weekly_trend_section.dart` | 7-day craving trend bars |
| `lib/core/services/notification_trigger_service.dart` | Smart notification logic |

### Modified Files (15 files)
| File | Change |
|---|---|
| `lib/features/home/presentation/pages/home_page.dart` | Replace widget list with new structure |
| `lib/features/home/presentation/widgets/home_header.dart` | Minor text update |
| `lib/features/home/presentation/bloc/home_bloc.dart` | Add streak loading, check-in processing |
| `lib/features/home/presentation/bloc/home_state.dart` | Add streak field to loaded state |
| `lib/features/home/presentation/bloc/home_event.dart` | Add checkIn event |
| `lib/features/home/domain/entities/user_stats.dart` | Add cravingsResisted, totalCheckIns |
| `lib/features/progress/presentation/pages/progress_page.dart` | Add WeeklyTrend + Milestones sections |
| `lib/features/progress/presentation/widgets/health_milestones_section.dart` | l10n fix |
| `lib/features/progress/presentation/widgets/detailed_insights_section.dart` | l10n fix + "Your Streak" |
| `lib/features/journey/presentation/pages/journey_page.dart` | Add JourneyMilestonesSection |
| `lib/features/settings/presentation/pages/notifications_page.dart` | Add streak + smart toggles |
| `lib/features/settings/presentation/bloc/settings_bloc.dart` | Add streak mode + notification toggles |
| `lib/core/di/injection.dart` | Register streak + milestone dependencies |
| `lib/l10n/app_en.arb` | Add all new l10n keys |
| `lib/l10n/app_ar.arb` | Add all new l10n keys (Arabic) |

### Deleted Files (1 file)
| File | Reason |
|---|---|
| `lib/features/home/presentation/widgets/home_stats_bar.dart` | Stats absorbed into StreakHeroCard |

---

## Testing Strategy

- **Unit tests:** Streak logic (increment, reset, forgiveness, mode switching), milestone threshold checking
- **Bloc tests:** HomeBloc state transitions with streak, ProgressBloc with milestones
- **Widget tests:** HeatmapGrid rendering with various data states, MilestoneCard locked/unlocked states
- **Integration:** Check-in flow → streak increment → milestone check → notification scheduling
- Uses `mocktail` for mocking, `bloc_test` for bloc testing (per AGENTS.md)

---

## Constraints

- **Strictly offline:** All data in Isar, no network calls
- **No external animation packages:** Flutter built-in only
- **No external chart libraries:** CustomPainter for the weekly trend
- **Accessibility:** Respect `disableAnimations` system setting
- **Brand voice:** All user-facing text uses compassionate, non-judgmental language from `brand.md`
- **Dynamic computations:** Use `cigarettePrice` from `UserProfile` for money calculations (per AGENTS.md)
