import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import '../../../../core/presentation/animations/animated_count_up.dart';
import '../../../../core/presentation/animations/fade_scale_switcher.dart';
import '../../../../core/presentation/widgets/sanctuary_card.dart';
import '../../../../core/presentation/widgets/stat_item.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../journey/domain/entities/journey_day.dart';
import '../../../streak/domain/entities/streak.dart';
import '../../domain/entities/user_stats.dart';
import 'heatmap_grid.dart';

class StreakHeroCard extends StatelessWidget {
  final Streak streak;
  final UserStats stats;
  final List<JourneyDay> journeyHistory;

  const StreakHeroCard({
    super.key,
    required this.streak,
    required this.stats,
    this.journeyHistory = const [],
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: SanctuaryCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FadeScaleSwitcher(
                      key: ValueKey('streak_${streak.currentCount}'),
                      child: Text(
                        '${streak.currentCount}',
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                              color: AppTheme.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text('🔥', style: TextStyle(fontSize: 28)),
                  ],
                ),
                Text(
                  streak.currentCount == 0 ? 'Start your streak' : 'Day streak',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppTheme.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            HeatmapGrid(history: journeyHistory),
            const SizedBox(height: 20),
            const Divider(color: AppTheme.surfaceContainerLow, height: 1),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StatItem(
                  value: '\$${stats.moneySaved.toStringAsFixed(0)}',
                  valueWidget: AnimatedCountUp(
                    value: stats.moneySaved,
                    prefix: '\$',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.onSurface,
                        ),
                  ),
                  label: l10n.moneySavedLabel,
                  icon: SolarIconsOutline.walletMoney,
                ),
                StatItem(
                  value: '${stats.cigarettesAvoided}',
                  valueWidget: AnimatedCountUp(
                    value: stats.cigarettesAvoided,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.onSurface,
                        ),
                  ),
                  label: l10n.cigsAvoidedLabel,
                  icon: SolarIconsOutline.maskHapply,
                ),
                StatItem(
                  value: '${stats.daysSmokeFree}d',
                  valueWidget: AnimatedCountUp(
                    value: stats.daysSmokeFree,
                    suffix: 'd',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.onSurface,
                        ),
                  ),
                  label: l10n.timeSmokeFreeLabel,
                  icon: SolarIconsOutline.clockCircle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
