import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quitra/features/journey/presentation/bloc/journey_bloc.dart';
import 'package:quitra/features/journey/presentation/bloc/journey_state.dart';
import 'package:quitra/features/journey/presentation/pages/journey_page.dart';
import 'package:quitra/features/milestones/data/milestone_definitions.dart';
import 'package:quitra/features/milestones/domain/repositories/milestone_repository.dart';
import 'package:quitra/l10n/app_localizations.dart';

class MockMilestoneRepository extends Mock implements MilestoneRepository {}
class MockJourneyBloc extends Mock implements JourneyBloc {}

void main() {
  late MockMilestoneRepository mockMilestoneRepo;
  late MockJourneyBloc mockJourneyBloc;

  setUp(() {
    final getIt = GetIt.instance;
    if (getIt.isRegistered<MilestoneRepository>()) {
      getIt.unregister<MilestoneRepository>();
    }
    if (getIt.isRegistered<JourneyBloc>()) {
      getIt.unregister<JourneyBloc>();
    }

    mockMilestoneRepo = MockMilestoneRepository();
    mockJourneyBloc = MockJourneyBloc();

    getIt.registerSingleton<MilestoneRepository>(mockMilestoneRepo);
    getIt.registerFactory<JourneyBloc>(() => mockJourneyBloc);

    when(() => mockMilestoneRepo.getAllMilestones())
        .thenAnswer((_) async => const Right(predefinedMilestones));
    when(() => mockJourneyBloc.state).thenReturn(const JourneyState.loaded(
          history: [],
          milestones: predefinedMilestones,
        ));
    when(() => mockJourneyBloc.stream).thenAnswer((_) => const Stream.empty());
    when(() => mockJourneyBloc.close()).thenAnswer((_) async {});
  });

  tearDown(() {
    final getIt = GetIt.instance;
    if (getIt.isRegistered<MilestoneRepository>()) {
      getIt.unregister<MilestoneRepository>();
    }
    if (getIt.isRegistered<JourneyBloc>()) {
      getIt.unregister<JourneyBloc>();
    }
  });

  testWidgets('JourneyPage displays translated milestone section title and cards in Arabic', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        locale: Locale('ar'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(body: JourneyPage()),
      ),
    );

    await tester.pumpAndSettle();

    // Verify translated section title
    expect(find.text('القوة والالتزام'), findsOneWidget);
    // Verify translated category chips
    expect(find.text('الكل'), findsOneWidget);
    expect(find.text('القوة'), findsOneWidget);
    expect(find.text('الالتزام'), findsOneWidget);
    // Verify translated milestone title
    expect(find.text('تجاوز أول رغبة'), findsOneWidget);
  });

  testWidgets('JourneyPage displays translated milestone section title and cards in English', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        locale: Locale('en'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(body: JourneyPage()),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Strength & Dedication'), findsOneWidget);
    expect(find.text('All'), findsOneWidget);
    expect(find.text('Strength'), findsOneWidget);
    expect(find.text('Dedication'), findsOneWidget);
    expect(find.text('First Moment Passed'), findsOneWidget);
  });
}
