import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:intl/intl.dart';
import 'stat_card.dart';

class DetailedInsightsSection extends StatelessWidget {
  final double moneySaved;
  final int cigarettesAvoided;
  final int lifeRegainedMinutes;
  final int currentStreak;

  const DetailedInsightsSection({
    super.key,
    required this.moneySaved,
    required this.cigarettesAvoided,
    required this.lifeRegainedMinutes,
    required this.currentStreak,
  });

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(symbol: '\$');
    final lifeRegainedDays = (lifeRegainedMinutes / 1440).floor();
    final streakText = currentStreak == 1 ? '1 day' : '$currentStreak days';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Detailed Insights',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
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
            StatCard(
              label: 'Money Saved',
              value: currencyFormat.format(moneySaved),
              icon: SolarIconsOutline.cardTransfer,
            ),
            StatCard(
              label: 'Cigarettes Avoided',
              value: NumberFormat.decimalPattern().format(cigarettesAvoided),
              icon: SolarIconsOutline.maskHapply,
            ),
            StatCard(
              label: 'Life Regained',
              value: lifeRegainedDays > 0 ? '${lifeRegainedDays}d' : '<1d',
              icon: SolarIconsOutline.health,
            ),
            StatCard(
              label: 'Clean Streak',
              value: streakText,
              icon: SolarIconsOutline.star,
            ),
          ],
        ),
      ],
    );
  }
}