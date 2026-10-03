import 'package:flutter/material.dart';
import 'package:quitra/core/theme/app_theme.dart';
import 'package:quitra/features/onboarding/presentation/widgets/step_container.dart';
import 'package:quitra/features/streak/domain/entities/streak.dart';
import 'package:quitra/l10n/app_localizations.dart';
import 'package:solar_icons/solar_icons.dart';

class StreakModeStep extends StatelessWidget {
  final StreakMode value;
  final ValueChanged<StreakMode> onChanged;

  const StreakModeStep({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return StepContainer(
      title: l10n.streakModeLabel,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.streakModeDescription,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.onSurfaceVariant.withValues(alpha: 0.8),
                  height: 1.6,
                ),
          ),
          const SizedBox(height: 20),
          _StreakOptionCard(
            title: '${l10n.forgivingModeLabel} (${l10n.recommendedLabel})',
            description: l10n.forgivingModeDesc,
            outlineIcon: SolarIconsOutline.shieldCheck,
            boldIcon: SolarIconsBold.shieldCheck,
            isSelected: value == StreakMode.forgiving,
            onTap: () => onChanged(StreakMode.forgiving),
          ),
          const SizedBox(height: 12),
          _StreakOptionCard(
            title: l10n.strictModeLabel,
            description: l10n.strictModeDesc,
            outlineIcon: SolarIconsOutline.fire,
            boldIcon: SolarIconsBold.fire,
            isSelected: value == StreakMode.strict,
            onTap: () => onChanged(StreakMode.strict),
          ),
        ],
      ),
    );
  }
}

class _StreakOptionCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData outlineIcon;
  final IconData boldIcon;
  final bool isSelected;
  final VoidCallback onTap;

  const _StreakOptionCard({
    required this.title,
    required this.description,
    required this.outlineIcon,
    required this.boldIcon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? AppTheme.primary.withValues(alpha: 0.08)
              : AppTheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? AppTheme.primary
                : AppTheme.primary.withValues(alpha: 0.12),
            width: 2,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppTheme.primary.withValues(alpha: 0.15)
                    : AppTheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                isSelected ? boldIcon : outlineIcon,
                color: isSelected ? AppTheme.primary : AppTheme.onSurfaceVariant,
                size: 22,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: isSelected ? AppTheme.primary : AppTheme.onSurface,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppTheme.onSurfaceVariant.withValues(alpha: 0.8),
                          height: 1.5,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            if (isSelected)
              const Icon(
                SolarIconsBold.checkCircle,
                color: AppTheme.primary,
                size: 22,
              )
            else
              const SizedBox(width: 22, height: 22),
          ],
        ),
      ),
    );
  }
}
