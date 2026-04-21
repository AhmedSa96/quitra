import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quitra/l10n/app_localizations.dart';
import '../../../../core/di/injection.dart';
import '../bloc/progress_bloc.dart';
import '../bloc/progress_event.dart';
import '../bloc/progress_state.dart';
import '../widgets/progress_header.dart';
import '../widgets/health_milestones_section.dart';
import '../widgets/detailed_insights_section.dart';
import '../widgets/progress_loading_view.dart';
import '../widgets/progress_error_view.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProgressBloc>()..add(ProgressEvent.loadProgress()),
      child: const _ProgressPageContent(),
    );
  }
}

class _ProgressPageContent extends StatelessWidget {
  const _ProgressPageContent();

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
                const SizedBox(height: 48),
                HealthMilestonesSection(
                  heartProgress: heartProgress,
                  circulationProgress: circulationProgress,
                  lungProgress: lungProgress,
                  heartLabel: l10n.heartRateLabel,
                  circulationLabel: l10n.circulationLabel,
                  lungLabel: l10n.lungFunctionLabel,
                ),
                const SizedBox(height: 48),
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