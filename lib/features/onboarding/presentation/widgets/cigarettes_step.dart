import 'package:flutter/material.dart';
import 'package:quitra/core/theme/app_theme.dart';
import 'package:quitra/features/onboarding/presentation/widgets/step_container.dart';
import 'package:quitra/l10n/app_localizations.dart';

class CigarettesStep extends StatelessWidget {
  final int value;
  final ValueChanged<int> onChanged;

  const CigarettesStep({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return StepContainer(
      title: AppLocalizations.of(context)!.cigarettesPerDayQuestion,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$value',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              color: AppTheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Slider(
            value: value.toDouble(),
            min: 1,
            max: 60,
            activeColor: AppTheme.primary,
            onChanged: (val) => onChanged(val.toInt()),
          ),
        ],
      ),
    );
  }
}
