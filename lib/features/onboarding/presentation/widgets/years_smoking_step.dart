import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import 'step_container.dart';

class YearsSmokingStep extends StatelessWidget {
  final int value;
  final ValueChanged<int> onChanged;

  const YearsSmokingStep({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return StepContainer(
      title: "How many years have you been smoking?",
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
            min: 0,
            max: 50,
            activeColor: AppTheme.primary,
            onChanged: (val) => onChanged(val.toInt()),
          ),
        ],
      ),
    );
  }
}
