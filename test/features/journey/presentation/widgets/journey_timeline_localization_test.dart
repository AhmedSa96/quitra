import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quitra/features/journey/domain/entities/journey_day.dart';
import 'package:quitra/features/journey/presentation/bloc/journey_bloc.dart';
import 'package:quitra/features/journey/presentation/bloc/journey_state.dart';
import 'package:quitra/features/journey/presentation/widgets/journey_timeline_item.dart';
import 'package:quitra/l10n/app_localizations.dart';

class MockJourneyBloc extends Mock implements JourneyBloc {}

void main() {
  late MockJourneyBloc mockJourneyBloc;

  setUp(() {
    mockJourneyBloc = MockJourneyBloc();
    when(() => mockJourneyBloc.state).thenReturn(const JourneyState.initial());
    when(() => mockJourneyBloc.stream).thenAnswer((_) => const Stream.empty());
  });

  testWidgets('JourneyTimelineItem formats dates in Arabic', (tester) async {
    final day = JourneyDay(
      date: DateTime(2026, 10, 3),
      status: JourneyStatus.clean,
    );

    await tester.pumpWidget(
      BlocProvider<JourneyBloc>.value(
        value: mockJourneyBloc,
        child: MaterialApp(
          locale: const Locale('ar'),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: JourneyTimelineItem(day: day),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // In Arabic locale, month 10 should be formatted in Arabic (أكتوبر)
    expect(find.textContaining('أكتوبر'), findsOneWidget);
    expect(find.textContaining('October'), findsNothing);
  });

  testWidgets('JourneyTimelineItem formats dates in English', (tester) async {
    final day = JourneyDay(
      date: DateTime(2026, 10, 3),
      status: JourneyStatus.clean,
    );

    await tester.pumpWidget(
      BlocProvider<JourneyBloc>.value(
        value: mockJourneyBloc,
        child: MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: JourneyTimelineItem(day: day),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.textContaining('October'), findsOneWidget);
  });
}
