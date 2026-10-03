import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quitra/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:quitra/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:quitra/features/onboarding/presentation/widgets/streak_mode_step.dart';
import 'package:quitra/features/streak/domain/entities/streak.dart';
import 'package:quitra/l10n/app_localizations.dart';

class MockOnboardingBloc extends Mock implements OnboardingBloc {}

void main() {
  late MockOnboardingBloc mockOnboardingBloc;

  setUpAll(() {
    registerFallbackValue(const OnboardingState.initial());
    registerFallbackValue(OnboardingStarted(
      cigarettesPerDay: 10,
      yearsSmoking: 5,
      quitMethod: 'cold_turkey',
      quitStartDate: DateTime.now(),
      streakMode: StreakMode.forgiving,
    ));
  });

  setUp(() {
    mockOnboardingBloc = MockOnboardingBloc();
    when(() => mockOnboardingBloc.state).thenReturn(const OnboardingState.initial());
    when(() => mockOnboardingBloc.stream).thenAnswer((_) => const Stream.empty());
    when(() => mockOnboardingBloc.close()).thenAnswer((_) async {});
  });

  Widget createWidget() {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: BlocProvider<OnboardingBloc>.value(
        value: mockOnboardingBloc,
        child: const OnboardingPage(),
      ),
    );
  }

  testWidgets('displays 7 total steps and navigates through StreakModeStep as Step 5', (tester) async {
    await tester.pumpWidget(createWidget());
    await tester.pumpAndSettle();

    final l10n = await AppLocalizations.delegate.load(const Locale('en'));

    // Step 1: Import Data
    expect(find.text(l10n.stepProgress(1, 7)), findsOneWidget);
    await tester.tap(find.text(l10n.onboardingImportSkip));
    await tester.pumpAndSettle();

    // Step 2: Cigarettes per day
    expect(find.text(l10n.stepProgress(2, 7)), findsOneWidget);
    await tester.tap(find.text(l10n.continueButton));
    await tester.pumpAndSettle();

    // Step 3: Years smoking
    expect(find.text(l10n.stepProgress(3, 7)), findsOneWidget);
    await tester.tap(find.text(l10n.continueButton));
    await tester.pumpAndSettle();

    // Step 4: Quit method
    expect(find.text(l10n.stepProgress(4, 7)), findsOneWidget);
    await tester.tap(find.text(l10n.continueButton));
    await tester.pumpAndSettle();

    // Step 5: Streak Mode Step!
    expect(find.text(l10n.stepProgress(5, 7)), findsOneWidget);
    expect(find.byType(StreakModeStep), findsOneWidget);
    expect(find.text('${l10n.forgivingModeLabel} (${l10n.recommendedLabel})'), findsOneWidget);

    // Switch to strict mode
    await tester.tap(find.text(l10n.strictModeLabel));
    await tester.pumpAndSettle();

    // Step 6: Quit date
    await tester.tap(find.text(l10n.continueButton));
    await tester.pumpAndSettle();
    expect(find.text(l10n.stepProgress(6, 7)), findsOneWidget);

    // Step 7: Cigarette price
    await tester.tap(find.text(l10n.continueButton));
    await tester.pumpAndSettle();
    expect(find.text(l10n.stepProgress(7, 7)), findsOneWidget);

    // Complete onboarding
    await tester.tap(find.text(l10n.continueButton));
    await tester.pumpAndSettle();

    // Verify OnboardingStarted is dispatched with StreakMode.strict
    final captured = verify(() => mockOnboardingBloc.add(captureAny())).captured;
    expect(captured.length, 1);
    final event = captured.first as OnboardingStarted;
    expect(event.streakMode, StreakMode.strict);
  });
}
