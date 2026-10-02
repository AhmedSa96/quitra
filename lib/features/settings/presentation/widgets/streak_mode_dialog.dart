import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quitra/core/theme/app_theme.dart';
import 'package:quitra/features/streak/domain/entities/streak.dart';
import 'package:quitra/l10n/app_localizations.dart';
import 'package:solar_icons/solar_icons.dart';
import '../bloc/settings_bloc.dart';

class StreakModeDialog extends StatelessWidget {
  const StreakModeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppTheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primary.withValues(alpha: 0.08),
              blurRadius: 40,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, state) {
              final currentMode = state.streakMode;

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Streak Mode',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: 24,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Choose how your daily streak handles setbacks.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.onSurfaceVariant.withValues(alpha: 0.8),
                        ),
                  ),
                  const SizedBox(height: 24),
                  _buildModeOption(
                    context,
                    title: 'Forgiving Mode (Recommended)',
                    description: 'One grace pass per week so one difficult moment doesn\'t reset all your hard work.',
                    icon: SolarIconsOutline.shieldCheck,
                    isSelected: currentMode == StreakMode.forgiving,
                    onTap: () {
                      context.read<SettingsBloc>().add(const StreakModeChanged(StreakMode.forgiving));
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildModeOption(
                    context,
                    title: 'Strict Mode',
                    description: 'Streak resets immediately to 0 on any setback or missed check-in.',
                    icon: SolarIconsOutline.fire,
                    isSelected: currentMode == StreakMode.strict,
                    onTap: () {
                      context.read<SettingsBloc>().add(const StreakModeChanged(StreakMode.strict));
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        l10n.cancelAction,
                        style: TextStyle(color: AppTheme.onSurfaceVariant),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildModeOption(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primary.withValues(alpha: 0.08) : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppTheme.primary : AppTheme.primary.withValues(alpha: 0.1),
            width: 2,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isSelected ? AppTheme.primary.withValues(alpha: 0.15) : AppTheme.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: isSelected ? AppTheme.primary : AppTheme.onSurfaceVariant,
                size: 20,
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
                          fontWeight: FontWeight.w600,
                          color: isSelected ? AppTheme.primary : AppTheme.onSurface,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppTheme.onSurfaceVariant.withValues(alpha: 0.7),
                          height: 1.3,
                        ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(
                SolarIconsBold.checkCircle,
                color: AppTheme.primary,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}
