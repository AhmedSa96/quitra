import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quitra/features/home/domain/entities/today_check_in_status.dart';
import 'package:quitra/features/home/domain/entities/user_stats.dart';
import 'package:quitra/features/home/presentation/bloc/home_bloc.dart';
import 'package:quitra/features/home/presentation/bloc/home_state.dart';
import 'package:quitra/features/home/presentation/widgets/daily_check_in_dialog.dart';
import 'package:quitra/features/streak/domain/entities/streak.dart';
import 'package:quitra/l10n/app_localizations.dart';

class MockHomeBloc extends Mock implements HomeBloc {}

void main() {
  late MockHomeBloc mockHomeBloc;

  const mockStats = UserStats(
    daysSmokeFree: 5,
    cigarettesAvoided: 50,
    moneySaved: 25.0,
    cravingsLogged: 3,
  );

  const mockStreak = Streak(
    currentCount: 5,
    longestCount: 5,
    lastCheckInDate: null,
    mode: StreakMode.strict,
  );

  setUp(() {
    mockHomeBloc = MockHomeBloc();
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

  testWidgets('DailyCheckInDialog pre-fills today status and displays notesLoggedToday badge', (tester) async {
    when(() => mockHomeBloc.state).thenReturn(
      const HomeState.loaded(
        stats: mockStats,
        streak: mockStreak,
        todayStatus: TodayCheckInStatus(
          hasCheckedIn: true,
          wasSmoked: true,
          cravingLevel: 4,
          notesCount: 2,
        ),
      ),
    );

    await tester.pumpWidget(buildTestableWidget(const DailyCheckInDialog()));
    await tester.pumpAndSettle();

    // Verify switch is ON because wasSmoked == true
    final switchFinder = find.byType(Switch);
    expect(switchFinder, findsOneWidget);
    final switchWidget = tester.widget<Switch>(switchFinder);
    expect(switchWidget.value, true);

    // Verify slider is at 4 because cravingLevel == 4
    final sliderFinder = find.byType(Slider);
    expect(sliderFinder, findsOneWidget);
    final sliderWidget = tester.widget<Slider>(sliderFinder);
    expect(sliderWidget.value, 4.0);

    // Verify notesLoggedToday badge is displayed with 2 notes
    expect(find.text('2 notes logged today'), findsOneWidget);
  });
}
