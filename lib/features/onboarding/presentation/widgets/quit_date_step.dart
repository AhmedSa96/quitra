import 'package:flutter/material.dart';
import 'package:quitra/l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_theme.dart';
import 'step_container.dart';

class QuitDateStep extends StatelessWidget {
  final DateTime value;
  final ValueChanged<DateTime> onChanged;

  const QuitDateStep({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).toString();

    return StepContainer(
      title: l10n.quitDateQuestion,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            DateFormat.yMd(locale).format(value),
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: AppTheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: value,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (date != null) {
                if (!context.mounted) return;
                onChanged(date);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.surfaceContainerLow,
              foregroundColor: AppTheme.primary,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(999),
              ),
            ),
            child: Text(l10n.changeDate),
          ),
        ],
      ),
    );
  }
}
