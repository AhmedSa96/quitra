import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:quitra/core/theme/app_theme.dart';
import 'package:quitra/core/presentation/widgets/sanctuary_card.dart';

class ProfileSummaryCard extends StatelessWidget {
  final String name;
  final String membershipStatus;

  const ProfileSummaryCard({
    super.key,
    required this.name,
    required this.membershipStatus,
  });

  @override
  Widget build(BuildContext context) {
    return SanctuaryCard(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppTheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              SolarIconsBold.user,
              color: AppTheme.primary,
              size: 32,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  membershipStatus,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppTheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
