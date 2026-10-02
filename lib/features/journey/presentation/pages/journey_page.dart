import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quitra/l10n/app_localizations.dart';
import '../../../../core/di/injection.dart';
import '../../../milestones/domain/entities/milestone.dart';
import '../../../milestones/domain/repositories/milestone_repository.dart';
import '../../../milestones/presentation/widgets/milestones_section.dart';
import '../bloc/journey_bloc.dart';
import '../bloc/journey_event.dart';
import '../bloc/journey_state.dart';
import '../widgets/journey_timeline_item.dart';

class JourneyPage extends StatefulWidget {
  const JourneyPage({super.key});

  @override
  State<JourneyPage> createState() => _JourneyPageState();
}

class _JourneyPageState extends State<JourneyPage> {
  List<Milestone> _milestones = [];

  @override
  void initState() {
    super.initState();
    _loadMilestones();
  }

  Future<void> _loadMilestones() async {
    final result = await getIt<MilestoneRepository>().getAllMilestones();
    result.fold((_) {}, (milestones) {
      if (mounted) setState(() => _milestones = milestones);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<JourneyBloc>()..add(const JourneyEvent.loadHistory()),
      child: _JourneyView(milestones: _milestones),
    );
  }
}

class _JourneyView extends StatelessWidget {
  final List<Milestone> milestones;

  const _JourneyView({required this.milestones});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.journeyTitle,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 24),

            if (milestones.isNotEmpty) ...[
              MilestonesSection(
                title: 'Strength & Dedication',
                milestones: milestones,
                allowedCategories: const [
                  MilestoneCategory.strength,
                  MilestoneCategory.dedication,
                ],
              ),
              const SizedBox(height: 32),
            ],

            Text(
              l10n.journeyHistoryTitle,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 24),

            BlocBuilder<JourneyBloc, JourneyState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () => const Center(
                    child: Padding(
                      padding: EdgeInsets.all(32.0),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  loaded: (history) {
                    if (history.isEmpty) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Text(
                            l10n.journeyStartMessage,
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                                ),
                          ),
                        ),
                      );
                    }
                    return Column(
                      children: history.map((day) => JourneyTimelineItem(day: day)).toList(),
                    );
                  },
                  error: (message) => Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Text(
                        message,
                        style: TextStyle(color: Theme.of(context).colorScheme.error),
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
