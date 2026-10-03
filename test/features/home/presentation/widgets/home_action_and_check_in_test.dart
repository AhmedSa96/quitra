import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quitra/features/home/presentation/bloc/home_bloc.dart';
import 'package:quitra/features/home/presentation/bloc/home_event.dart';
import 'package:quitra/features/home/presentation/bloc/home_state.dart';
import 'package:quitra/features/home/presentation/widgets/home_action_section.dart';
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

  testWidgets('HomeActionSection displays How was your day and opens DailyCheckInDialog', (tester) async {
    await tester.pumpWidget(buildTestableWidget(const HomeActionSection()));

    // Verify "How was your day?" is displayed on primary button
    expect(find.text('How was your day?'), findsOneWidget);
    expect(find.text('I feel like smoking'), findsNothing);

    // Tap button to open dialog
    await tester.tap(find.text('How was your day?'));
    await tester.pumpAndSettle();

    // Verify dialog contents
    expect(find.text('Did you smoke today?'), findsOneWidget);
    expect(find.text('Watch Ad & Save Journal'), findsOneWidget);
    expect(find.textContaining('Watching ads helps us keep Quitra free'), findsOneWidget);

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
}
