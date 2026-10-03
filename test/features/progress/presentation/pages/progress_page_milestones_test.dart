import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quitra/features/milestones/data/milestone_definitions.dart';
import 'package:quitra/features/milestones/domain/repositories/milestone_repository.dart';
import 'package:quitra/features/milestones/presentation/widgets/milestones_section.dart';
import 'package:quitra/features/progress/domain/entities/progress_stats.dart';
import 'package:quitra/features/progress/presentation/bloc/progress_bloc.dart';
import 'package:quitra/features/progress/presentation/bloc/progress_state.dart';
import 'package:quitra/features/progress/presentation/pages/progress_page.dart';
import 'package:quitra/l10n/app_localizations.dart';

class MockMilestoneRepository extends Mock implements MilestoneRepository {}
class MockProgressBloc extends Mock implements ProgressBloc {}

void main() {
  late MockMilestoneRepository mockMilestoneRepo;
  late MockProgressBloc mockProgressBloc;

  setUp(() {
    final getIt = GetIt.instance;
    if (getIt.isRegistered<MilestoneRepository>()) {
      getIt.unregister<MilestoneRepository>();
    }
    if (getIt.isRegistered<ProgressBloc>()) {
      getIt.unregister<ProgressBloc>();
    }

    mockMilestoneRepo = MockMilestoneRepository();
    mockProgressBloc = MockProgressBloc();

    getIt.registerSingleton<MilestoneRepository>(mockMilestoneRepo);
    getIt.registerFactory<ProgressBloc>(() => mockProgressBloc);

    const mockStats = ProgressStats(
      daysSmokeFree: 1,
      moneySaved: 10,
      cigarettesAvoided: 5,
      lifeRegainedMinutes: 55,
      currentStreak: 1,
      heartRateProgress: 0.1,
      circulationProgress: 0.1,
      lungFunctionProgress: 0.1,
    );
    when(() => mockMilestoneRepo.getAllMilestones())
        .thenAnswer((_) async => const Right(predefinedMilestones));
    when(() => mockProgressBloc.state).thenReturn(const ProgressState.loaded(
      stats: mockStats,
      milestones: predefinedMilestones,
    ));
    when(() => mockProgressBloc.stream).thenAnswer((_) => const Stream.empty());
    when(() => mockProgressBloc.close()).thenAnswer((_) async {});
  });

  tearDown(() {
    final getIt = GetIt.instance;
    if (getIt.isRegistered<MilestoneRepository>()) {
      getIt.unregister<MilestoneRepository>();
    }
    if (getIt.isRegistered<ProgressBloc>()) {
      getIt.unregister<ProgressBloc>();
    }
  });

  testWidgets('ProgressPage displays translated milestone section title and cards in Arabic', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        locale: Locale('ar'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(body: ProgressPage()),
      ),
    );

    await tester.pumpAndSettle();

    // Verify translated section title
    expect(find.text('إنجازاتك'), findsOneWidget);
    // Verify translated category chips and cards within MilestonesSection
    final milestonesSectionFinder = find.byType(MilestonesSection);
    expect(milestonesSectionFinder, findsOneWidget);
    expect(find.descendant(of: milestonesSectionFinder, matching: find.text('الكل')), findsOneWidget);
    expect(find.descendant(of: milestonesSectionFinder, matching: find.text('الوقت')), findsOneWidget);
    expect(find.descendant(of: milestonesSectionFinder, matching: find.text('الصحة')), findsOneWidget);
    expect(find.descendant(of: milestonesSectionFinder, matching: find.text('التوفير')), findsOneWidget);
    expect(find.descendant(of: milestonesSectionFinder, matching: find.text('الاستمرار')), findsOneWidget);
    // Verify translated milestone title
    expect(find.descendant(of: milestonesSectionFinder, matching: find.text('اليوم الأول')), findsOneWidget);
  });

  testWidgets('ProgressPage displays translated milestone section title and cards in English', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        locale: Locale('en'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(body: ProgressPage()),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Your Milestones'), findsOneWidget);
    final milestonesSectionFinder = find.byType(MilestonesSection);
    expect(milestonesSectionFinder, findsOneWidget);
    expect(find.descendant(of: milestonesSectionFinder, matching: find.text('All')), findsOneWidget);
    expect(find.descendant(of: milestonesSectionFinder, matching: find.text('Time')), findsOneWidget);
    expect(find.descendant(of: milestonesSectionFinder, matching: find.text('Health')), findsOneWidget);
    expect(find.descendant(of: milestonesSectionFinder, matching: find.text('Savings')), findsOneWidget);
    expect(find.descendant(of: milestonesSectionFinder, matching: find.text('Streak')), findsOneWidget);
    expect(find.descendant(of: milestonesSectionFinder, matching: find.text('Day One')), findsOneWidget);
  });
}
