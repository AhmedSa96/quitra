import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quitra/features/journey/domain/entities/journey_day.dart';
import 'package:quitra/features/journey/presentation/bloc/journey_bloc.dart';
import 'package:quitra/features/journey/presentation/bloc/journey_event.dart';
import 'package:quitra/features/journey/presentation/bloc/journey_state.dart';
import 'package:quitra/features/journey/presentation/pages/journey_page.dart';
import 'package:quitra/features/milestones/domain/repositories/milestone_repository.dart';
import 'package:quitra/l10n/app_localizations.dart';

class MockMilestoneRepository extends Mock implements MilestoneRepository {}
class MockJourneyBloc extends Mock implements JourneyBloc {}

void main() {
  late MockMilestoneRepository mockMilestoneRepo;
  late MockJourneyBloc mockJourneyBloc;

  final now = DateTime(2026, 10, 4);
  final twentyDays = List.generate(
    20,
    (i) => JourneyDay(
      date: now.subtract(Duration(days: i)),
      status: JourneyStatus.clean,
    ),
  );

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
        .thenAnswer((_) async => const Right([]));
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

  Widget buildTestWidget() {
    return const MaterialApp(
      locale: Locale('en'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(body: JourneyPage()),
    );
  }

  testWidgets('triggers loadMoreHistory when scrolled near bottom', (tester) async {
    when(() => mockJourneyBloc.state).thenReturn(JourneyState.loaded(
      history: twentyDays,
      milestones: const [],
      hasReachedMax: false,
      isLoadingMore: false,
    ));

    await tester.pumpWidget(buildTestWidget());
    await tester.pumpAndSettle();

    // Scroll down to the bottom
    await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -3000));
    await tester.pumpAndSettle();

    verify(() => mockJourneyBloc.add(const JourneyEvent.loadMoreHistory())).called(greaterThanOrEqualTo(1));
  });

  testWidgets('displays bottom CircularProgressIndicator when isLoadingMore is true', (tester) async {
    when(() => mockJourneyBloc.state).thenReturn(JourneyState.loaded(
      history: twentyDays,
      milestones: const [],
      hasReachedMax: false,
      isLoadingMore: true,
    ));

    await tester.pumpWidget(buildTestWidget());
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
