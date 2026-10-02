import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quitra/l10n/app_localizations.dart';
import '../../../../core/di/injection.dart';
import '../../../milestones/domain/entities/milestone.dart';
import '../../../milestones/domain/repositories/milestone_repository.dart';
import '../../../milestones/presentation/widgets/milestones_section.dart';
import '../bloc/progress_bloc.dart';
import '../bloc/progress_event.dart';
import '../bloc/progress_state.dart';
import '../widgets/progress_header.dart';
import '../widgets/health_milestones_section.dart';
import '../widgets/detailed_insights_section.dart';
import '../widgets/progress_loading_view.dart';
import '../widgets/progress_error_view.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
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
      create: (_) => getIt<ProgressBloc>()..add(ProgressEvent.loadProgress()),
      child: _ProgressPageContent(milestones: _milestones),
    );
  }
}

class _ProgressPageContent extends StatelessWidget {
  final List<Milestone> milestones;

  const _ProgressPageContent({required this.milestones});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocBuilder<ProgressBloc, ProgressState>(
      builder: (context, state) {
        if (state is Loading) {
          return const ProgressLoadingView();
        }

        if (state is Error) {
          return const ProgressErrorView();
        }

        final stats = state is Loaded ? state.stats : null;
        final heartProgress = stats?.heartRateProgress ?? 0.0;
        final circulationProgress = stats?.circulationProgress ?? 0.0;
        final lungProgress = stats?.lungFunctionProgress ?? 0.0;
        final moneySaved = stats?.moneySaved ?? 0.0;
        final cigsAvoided = stats?.cigarettesAvoided ?? 0;
        final lifeRegained = stats?.lifeRegainedMinutes ?? 0;
        final currentStreak = stats?.currentStreak ?? 0;

        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProgressHeader(title: l10n.progressTitle),
                const SizedBox(height: 32),
                HealthMilestonesSection(
                  heartProgress: heartProgress,
                  circulationProgress: circulationProgress,
                  lungProgress: lungProgress,
                  heartLabel: l10n.heartRateLabel,
                  circulationLabel: l10n.circulationLabel,
                  lungLabel: l10n.lungFunctionLabel,
                ),
                const SizedBox(height: 32),
                if (milestones.isNotEmpty)
                  MilestonesSection(
                    milestones: milestones,
                    allowedCategories: const [
                      MilestoneCategory.time,
                      MilestoneCategory.healthRecovery,
                      MilestoneCategory.savings,
                      MilestoneCategory.consistency,
                    ],
                  ),
                const SizedBox(height: 32),
                DetailedInsightsSection(
                  moneySaved: moneySaved,
                  cigarettesAvoided: cigsAvoided,
                  lifeRegainedMinutes: lifeRegained,
                  currentStreak: currentStreak,
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        );
      },
    );
  }
}