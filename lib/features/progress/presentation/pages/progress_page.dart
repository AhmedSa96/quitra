import 'package:flutter/material.dart';
import 'package:quitra/l10n/app_localizations.dart';
import 'package:solar_icons/solar_icons.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/presentation/widgets/sanctuary_card.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

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
              l10n.progressTitle,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 32),

            // Health Milestones Header
            Text(
              l10n.healthMilestonesTitle,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Heart Milestone
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
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Text(
                        "100%",
                        style: TextStyle(
                          color: AppTheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  LinearProgressIndicator(
                    value: 1.0,
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

            // Lung Milestone
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
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Text(
                        "65%",
                        style: TextStyle(
                          color: AppTheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  LinearProgressIndicator(
                    value: 0.65,
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

            // Detailed Stats Grid
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
                  "\$1,240",
                  SolarIconsOutline.cardTransfer,
                ),
                _buildStatCard(
                  context,
                  l10n.cigsAvoidedLabel,
                  "2,480",
                  SolarIconsOutline.maskHapply,
                ),
                _buildStatCard(
                  context,
                  l10n.lifeRegainedLabel,
                  "12d",
                  SolarIconsOutline.health,
                ),
                _buildStatCard(
                  context,
                  l10n.cleanStreakLabel,
                  "15 days",
                  SolarIconsOutline.star,
                ),
              ],
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
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
