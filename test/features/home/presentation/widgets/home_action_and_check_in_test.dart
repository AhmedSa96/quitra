import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quitra/features/home/domain/entities/today_check_in_status.dart';
import 'package:quitra/features/home/domain/entities/user_stats.dart';
import 'package:quitra/features/home/presentation/bloc/home_bloc.dart';
import 'package:quitra/features/home/presentation/bloc/home_event.dart';
import 'package:quitra/features/home/presentation/bloc/home_state.dart';
import 'package:quitra/features/home/presentation/widgets/home_action_section.dart';
import 'package:quitra/features/streak/domain/entities/streak.dart';
import 'package:quitra/l10n/app_localizations.dart';

class MockHomeBloc extends Mock implements HomeBloc {}

void main() {
  late MockHomeBloc mockHomeBloc;

  setUpAll(() {
    registerFallbackValue(
      const HomeEvent.saveDailyCheckIn(
        wasSmoked: false,
        cravingLevel: 1,
      ),
    );
    registerFallbackValue(
      const HomeEvent.appendNote(note: 'test note'),
    );
  });

  setUp(() {
    mockHomeBloc = MockHomeBloc();
    when(() => mockHomeBloc.state).thenReturn(const HomeState.initial());
    when(() => mockHomeBloc.stream).thenAnswer((_) => const Stream.empty());
  });

  Widget buildTestableWidget(Widget child) {
    return MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        body: BlocProvider<HomeBloc>.value(
          value: mockHomeBloc,
          child: child,
        ),
      ),
    );
  }

  testWidgets(
      'HomeActionSection displays How was your day when not checked in and opens DailyCheckInDialog',
      (tester) async {
    await tester.pumpWidget(buildTestableWidget(const HomeActionSection()));

    // Verify "How was your day?" is displayed on primary button
    expect(find.text('How was your day?'), findsOneWidget);
    expect(find.text('Append Note'), findsNothing);
    expect(find.text('I Smoked'), findsNothing);

    // Tap button to open dialog
    await tester.tap(find.text('How was your day?'));
    await tester.pumpAndSettle();

    // Verify dialog contents
    expect(find.text('Did you smoke today?'), findsOneWidget);
    expect(find.text('Watch Ad & Save Journal'), findsOneWidget);
    expect(find.textContaining('Watching ads helps us keep Quitra free'),
        findsOneWidget);

    // Tap "Watch Ad & Save Journal"
    await tester.tap(find.text('Watch Ad & Save Journal'));
    await tester.pumpAndSettle();

    // Verify saveDailyCheckIn was dispatched
    verify(
      () => mockHomeBloc.add(
        any(
          that: isA<HomeEvent>().having(
            (e) => e is SaveDailyCheckIn,
            'is SaveDailyCheckIn',
            isTrue,
          ),
        ),
      ),
    ).called(1);
  });

  testWidgets(
      'HomeActionSection displays Append Note and I Smoked when already checked in',
      (tester) async {
    when(() => mockHomeBloc.state).thenReturn(
      const HomeState.loaded(
        stats: UserStats(
          daysSmokeFree: 5,
          cigarettesAvoided: 50,
          moneySaved: 25.0,
          cravingsLogged: 3,
        ),
        streak: Streak(
          currentCount: 5,
          longestCount: 5,
          lastCheckInDate: null,
          mode: StreakMode.strict,
        ),
        todayStatus: TodayCheckInStatus(
          hasCheckedIn: true,
          wasSmoked: false,
          cravingLevel: 1,
          notesCount: 1,
        ),
      ),
    );

    await tester.pumpWidget(buildTestableWidget(const HomeActionSection()));

    // Verify transformed actions
    expect(find.text('How was your day?'), findsNothing);
    expect(find.text('Append Note'), findsOneWidget);
    expect(find.text('I Smoked'), findsOneWidget);

    // Tap "Append Note" -> Opens QuickNoteSheet
    await tester.tap(find.text('Append Note'));
    await tester.pumpAndSettle();

    expect(find.text('Capture a Reflection'), findsOneWidget);
    expect(find.text('Save Reflection'), findsOneWidget);

    // Enter note
    await tester.enterText(
        find.byType(TextField), 'Craving went away after deep breaths');
    await tester.tap(find.text('Save Reflection'));
    await tester.pumpAndSettle();

    verify(
      () => mockHomeBloc.add(
        const HomeEvent.appendNote(
            note: 'Craving went away after deep breaths'),
      ),
    ).called(1);
  });

  testWidgets('Tapping I Smoked opens SetbackSupportSheet and dispatches setback check-in',
      (tester) async {
    when(() => mockHomeBloc.state).thenReturn(
      const HomeState.loaded(
        stats: UserStats(
          daysSmokeFree: 5,
          cigarettesAvoided: 50,
          moneySaved: 25.0,
          cravingsLogged: 3,
        ),
        streak: Streak(
          currentCount: 5,
          longestCount: 5,
          lastCheckInDate: null,
          mode: StreakMode.strict,
        ),
        todayStatus: TodayCheckInStatus(
          hasCheckedIn: true,
          wasSmoked: false,
          cravingLevel: 1,
          notesCount: 1,
        ),
      ),
    );

    await tester.pumpWidget(buildTestableWidget(const HomeActionSection()));

    // Tap "I Smoked"
    await tester.tap(find.text('I Smoked'));
    await tester.pumpAndSettle();

    // Verify SetbackSupportSheet content
    expect(find.text('A Setback is Not Defeat'), findsOneWidget);
    expect(find.text('Log Setback & Keep Going'), findsOneWidget);

    // Submit setback
    await tester.tap(find.text('Log Setback & Keep Going'));
    await tester.pumpAndSettle();

    verify(
      () => mockHomeBloc.add(
        any(
          that: isA<HomeEvent>().having(
            (e) => e is SaveDailyCheckIn && e.wasSmoked == true,
            'is SaveDailyCheckIn with wasSmoked: true',
            isTrue,
          ),
        ),
      ),
    ).called(1);
  });
}
