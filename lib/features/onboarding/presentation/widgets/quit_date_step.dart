import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import 'step_container.dart';

class QuitDateStep extends StatelessWidget {
  final DateTime value;
  final ValueChanged<DateTime> onChanged;

  const QuitDateStep({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return StepContainer(
      title: "When is your quit start date?",
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "${value.day}/${value.month}/${value.year}",
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
                   lastDate: DateTime(2100)
                );
                if (date != null) {
                   onChanged(date);
                }
             }, 
             style: ElevatedButton.styleFrom(
               backgroundColor: AppTheme.surfaceContainerLow,
               foregroundColor: AppTheme.primary,
               elevation: 0,
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
             ),
             child: const Text('Change Date')
          ),
        ],
      )
    );
  }
}
