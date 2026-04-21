import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quitra/l10n/app_localizations.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:intl/intl.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/presentation/widgets/sanctuary_card.dart';
import '../bloc/progress_bloc.dart';
import '../bloc/progress_event.dart';
import '../bloc/progress_state.dart';

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
    final currencyFormat = NumberFormat.currency(symbol: '\$');

    return BlocBuilder<ProgressBloc, ProgressState>(
      builder: (context, state) {
        if (state is Loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is Error) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(l10n.databaseError, textAlign: TextAlign.center),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ProgressBloc>().add(
                        ProgressEvent.loadProgress(),
                      );
                    },
                    child: Text(l10n.continueButton),
                  ),
                ],
              ),
            ),
          );
        }

        final stats = state is Loaded ? state.stats : null;
        final heartProgress = stats?.heartRateProgress ?? 0.0;
        final circulationProgress = stats?.circulationProgress ?? 0.0;
        final lungProgress = stats?.lungFunctionProgress ?? 0.0;
        final moneySaved = stats?.moneySaved ?? 0.0;
        final cigsAvoided = stats?.cigarettesAvoided ?? 0;
        final lifeRegained = stats?.lifeRegainedMinutes ?? 0;
        final currentStreak = stats?.currentStreak ?? 0;

        final lifeRegainedDays = (lifeRegained / 1440).floor();
        final streakText = currentStreak == 1 ? '1 day' : '$currentStreak days';

        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 32.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.progressTitle,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 32),

                Text(
                  l10n.healthMilestonesTitle,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),

                SanctuaryCard(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            SolarIconsOutline.heart,
                            color: Color(0xFFE57373),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              l10n.heartRateLabel,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            '${(heartProgress * 100).toInt()}%',
                            style: const TextStyle(
                              color: AppTheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      LinearProgressIndicator(
                        value: heartProgress,
                        backgroundColor: AppTheme.surfaceContainerLow,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          AppTheme.primary,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                SanctuaryCard(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.favorite_border,
                            color: Color(0xFF64B5F6),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              l10n.circulationLabel,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            '${(circulationProgress * 100).toInt()}%',
                            style: const TextStyle(
                              color: AppTheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      LinearProgressIndicator(
                        value: circulationProgress,
                        backgroundColor: AppTheme.surfaceContainerLow,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          AppTheme.primary,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                SanctuaryCard(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            SolarIconsOutline.wind,
                            color: Color(0xFF64B5F6),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              l10n.lungFunctionLabel,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            '${(lungProgress * 100).toInt()}%',
                            style: const TextStyle(
                              color: AppTheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      LinearProgressIndicator(
                        value: lungProgress,
                        backgroundColor: AppTheme.surfaceContainerLow,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          AppTheme.primary,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 48),

                Text(
                  l10n.detailedInsights,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.3,
                  children: [
                    _buildStatCard(
                      context,
                      l10n.moneySavedLabel,
                      currencyFormat.format(moneySaved),
                      SolarIconsOutline.cardTransfer,
                    ),
                    _buildStatCard(
                      context,
                      l10n.cigsAvoidedLabel,
                      NumberFormat.decimalPattern().format(cigsAvoided),
                      SolarIconsOutline.maskHapply,
                    ),
                    _buildStatCard(
                      context,
                      l10n.lifeRegainedLabel,
                      lifeRegainedDays > 0 ? '${lifeRegainedDays}d' : '<1d',
                      SolarIconsOutline.health,
                    ),
                    _buildStatCard(
                      context,
                      l10n.cleanStreakLabel,
                      streakText,
                      SolarIconsOutline.star,
                    ),
                  ],
                ),

                const SizedBox(height: 32),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    return SanctuaryCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppTheme.primary, size: 24),
          const SizedBox(height: 12),
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.labelSmall?.copyWith(color: AppTheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
