import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:quitra/features/journey/domain/entities/journey_day.dart';
import 'package:quitra/features/journey/presentation/bloc/journey_state.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/app_localizations.dart';
import '../bloc/journey_bloc.dart';
import '../bloc/journey_event.dart';
import '../widgets/journey_day_status_card.dart';
import '../widgets/journey_day_note_card.dart';

class JourneyDayDetailsPage extends StatelessWidget {
  final JourneyDay day;

  const JourneyDayDetailsPage({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final dateText = DateFormat('MMMM d, yyyy').format(day.date);
    final now = DateTime.now();
    final isToday = day.date.year == now.year &&
        day.date.month == now.month &&
        day.date.day == now.day;

    return Scaffold(
      backgroundColor: AppTheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            SolarIconsOutline.altArrowLeft,
            color: AppTheme.onSurface,
          ),
          onPressed: () => context.pop(),
        ),
        title: Text(
          l10n.dayDetailsTitle,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<JourneyBloc, JourneyState>(
        builder: (context, state) {
          final currentDay = state.maybeWhen(
            loaded: (history) => history.firstWhere(
              (d) =>
                  d.date.year == day.date.year &&
                  d.date.month == day.date.month &&
                  d.date.day == day.date.day,
              orElse: () => day,
            ),
            orElse: () => day,
          );

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dateText,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppTheme.onSurface,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 32),
                  JourneyDayStatusCard(
                    day: currentDay,
                    isInteractive: isToday,
                    onWasSmokedChanged: (value) {
                      context.read<JourneyBloc>().add(
                            JourneyEvent.updateDay(
                              date: currentDay.date,
                              wasSmoked: value,
                            ),
                          );
                    },
                    onCravingLevelChanged: (level) {
                      context.read<JourneyBloc>().add(
                            JourneyEvent.updateDay(
                              date: currentDay.date,
                              cravingLevel: level,
                            ),
                          );
                    },
                  ),
                  const SizedBox(height: 24),
                  JourneyDayNoteCard(
                    initialNote: currentDay.note,
                    onSave: (newNote) {
                      context.read<JourneyBloc>().add(
                        JourneyEvent.updateDay(
                          date: currentDay.date,
                          note: newNote,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
