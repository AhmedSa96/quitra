import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import 'health_milestone_card.dart';

class HealthMilestonesSection extends StatelessWidget {
  final double heartProgress;
  final double circulationProgress;
  final double lungProgress;
  final String heartLabel;
  final String circulationLabel;
  final String lungLabel;

  const HealthMilestonesSection({
    super.key,
    required this.heartProgress,
    required this.circulationProgress,
    required this.lungProgress,
    required this.heartLabel,
    required this.circulationLabel,
    required this.lungLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Health Milestones',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        HealthMilestoneCard(
          label: heartLabel,
          progress: heartProgress,
          icon: SolarIconsOutline.heart,
          iconColor: const Color(0xFFE57373),
        ),
        const SizedBox(height: 16),
        HealthMilestoneCard(
          label: circulationLabel,
          progress: circulationProgress,
          icon: SolarIconsBold.heartPulse,
          iconColor: const Color(0xFF64B5F6),
        ),
        const SizedBox(height: 16),
        HealthMilestoneCard(
          label: lungLabel,
          progress: lungProgress,
          icon: SolarIconsOutline.wind,
          iconColor: const Color(0xFF64B5F6),
        ),
      ],
    );
  }
}