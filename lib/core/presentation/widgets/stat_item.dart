import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class StatItem extends StatelessWidget {
  final String label;
  final String value;
  final Widget? valueWidget;
  final IconData icon;

  const StatItem({
    super.key,
    required this.label,
    required this.value,
    this.valueWidget,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppTheme.primary, size: 24),
        const SizedBox(height: 12),
        valueWidget ??
            Text(
              value,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.onSurface,
                  ),
            ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    );
  }
}
