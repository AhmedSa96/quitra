import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quitra/features/journey/domain/entities/journey_day.dart';
import 'package:quitra/features/journey/domain/entities/journey_note.dart';
import 'package:quitra/features/journey/presentation/bloc/journey_bloc.dart';
import 'package:quitra/features/journey/presentation/bloc/journey_event.dart';
import 'package:quitra/features/journey/presentation/bloc/journey_state.dart';
import 'package:quitra/features/journey/presentation/pages/journey_day_details_page.dart';
import 'package:quitra/l10n/app_localizations.dart';

class MockJourneyBloc extends Mock implements JourneyBloc {}

void main() {
  late MockJourneyBloc mockBloc;

  setUpAll(() {
    registerFallbackValue(
      JourneyEvent.addNote(
        date: DateTime.now(),
        text: 'dummy',
      ),
    );
  });

  setUp(() {
    mockBloc = MockJourneyBloc();
    when(() => mockBloc.stream).thenAnswer((_) => const Stream.empty());
  });

  Widget buildTestableWidget(JourneyDay day) {
    return MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: BlocProvider<JourneyBloc>.value(
        value: mockBloc,
        child: JourneyDayDetailsPage(day: day),
      ),
    );
  }

  testWidgets('JourneyDayDetailsPage renders notes and shows Add Note composer for Today', (tester) async {
    final now = DateTime.now();
    final todayDay = JourneyDay(
      date: now,
      status: JourneyStatus.clean,
      notes: [
        JourneyNote(
          id: 1,
          createdAt: DateTime(now.year, now.month, now.day, 10, 15),
          text: 'Felt calm during morning routine',
        ),
      ],
    );

    when(() => mockBloc.state).thenReturn(JourneyState.loaded([todayDay]));

    await tester.pumpWidget(buildTestableWidget(todayDay));
    await tester.pumpAndSettle();

    // Verify notes are shown
    expect(find.text('Today\'s Reflections'), findsOneWidget);
    expect(find.text('Felt calm during morning routine'), findsOneWidget);

    // Verify Add Note button is present because it is Today
    expect(find.text('Add Note'), findsOneWidget);

    // Type a new note and tap Add Note
    final addNoteBtn = find.text('Add Note');
    await tester.ensureVisible(addNoteBtn);
    await tester.enterText(find.byType(TextField), 'Evening reflection');
    await tester.tap(addNoteBtn);
    await tester.pump();

    verify(() => mockBloc.add(any(that: isA<AddNote>()))).called(1);
  });

  testWidgets('JourneyDayDetailsPage hides Add Note composer for past days (read-only)', (tester) async {
    final pastDate = DateTime(2025, 1, 1);
    final pastDay = JourneyDay(
      date: pastDate,
      status: JourneyStatus.clean,
      notes: [
        JourneyNote(
          id: 1,
          createdAt: DateTime(2025, 1, 1, 14, 0),
          text: 'Past day authentic note',
        ),
      ],
    );

    when(() => mockBloc.state).thenReturn(JourneyState.loaded([pastDay]));

    await tester.pumpWidget(buildTestableWidget(pastDay));
    await tester.pumpAndSettle();

    // Verify note is rendered
    expect(find.text('Past day authentic note'), findsOneWidget);

    // Verify Add Note button is NOT shown because it is a past day
    expect(find.text('Add Note'), findsNothing);
  });
}
