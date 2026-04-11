import 'package:flutter/material.dart';
import 'package:quitra/l10n/app_localizations.dart';
import '../../../../core/theme/app_theme.dart';
import 'step_container.dart';

class QuitMethodStep extends StatelessWidget {
  final String value;
  final ValueChanged<String> onChanged;

  const QuitMethodStep({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return StepContainer(
      title: l10n.quitMethodQuestion,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildMethodOption(
            context,
            'cold_turkey',
            l10n.coldTurkeyTitle,
            l10n.coldTurkeyDescription,
            Icons.flash_on,
          ),
          const SizedBox(height: 16),
          _buildMethodOption(
            context,
            'gradual',
            l10n.gradualTitle,
            l10n.gradualDescription,
            Icons.trending_down,
          ),
        ],
      ),
    );
  }

  Widget _buildMethodOption(
    BuildContext context,
    String optionValue,
    String title,
    String description,
    IconData icon,
  ) {
    final isSelected = value == optionValue;
    return InkWell(
      onTap: () => onChanged(optionValue),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.surfaceContainerLow : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppTheme.primary.withValues(alpha: 0.1)
                    : Colors.grey.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: isSelected ? AppTheme.primary : Colors.grey,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: isSelected ? AppTheme.primary : AppTheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
