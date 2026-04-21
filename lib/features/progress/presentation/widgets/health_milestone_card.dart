import 'package:flutter/material.dart';
import 'package:quitra/core/theme/app_theme.dart';
import 'package:quitra/core/presentation/widgets/sanctuary_card.dart';

class HealthMilestoneCard extends StatelessWidget {
  final String label;
  final double progress;
  final IconData icon;
  final Color iconColor;

  const HealthMilestoneCard({
    super.key,
    required this.label,
    required this.progress,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return SanctuaryCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Icon(icon, color: iconColor),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                '${(progress * 100).toInt()}%',
                style: const TextStyle(
                  color: AppTheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: AppTheme.surfaceContainerLow,
            valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.primary),
            borderRadius: BorderRadius.circular(4),
            minHeight: 8,
          ),
        ],
      ),
    );
  }
}