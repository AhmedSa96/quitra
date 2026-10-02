import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import '../../../../core/presentation/widgets/sanctuary_card.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/milestone.dart';

class MilestoneCard extends StatelessWidget {
  final Milestone milestone;

  const MilestoneCard({
    super.key,
    required this.milestone,
  });

  IconData _getIconData(String name) {
    switch (name) {
      case 'heartPulse':
        return SolarIconsOutline.heartPulse;
      case 'routing':
        return SolarIconsOutline.routing;
      case 'wind':
        return SolarIconsOutline.wind;
      case 'walletMoney':
        return SolarIconsOutline.walletMoney;
      case 'fire':
        return SolarIconsOutline.fire;
      case 'shieldCheck':
        return SolarIconsOutline.shieldCheck;
      case 'notes':
        return SolarIconsOutline.notes;
      case 'calendarMinimalistic':
      default:
        return SolarIconsOutline.calendarMinimalistic;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: milestone.isUnlocked ? 1.0 : 0.4,
      child: SanctuaryCard(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: SizedBox(
          width: 110,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: milestone.isUnlocked
                      ? const Color(0xFF22C55E).withValues(alpha: 0.12)
                      : AppTheme.surfaceContainerLow,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _getIconData(milestone.iconName),
                  color: milestone.isUnlocked ? const Color(0xFF22C55E) : AppTheme.onSurfaceVariant,
                  size: 28,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                milestone.titleKey,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: milestone.isUnlocked ? AppTheme.onSurface : AppTheme.onSurfaceVariant,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
