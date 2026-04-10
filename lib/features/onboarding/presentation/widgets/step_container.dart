import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class StepContainer extends StatelessWidget {
  final String title;
  final Widget content;

  const StepContainer({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(letterSpacing: -0.02),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Card(
            color: AppTheme.surfaceContainerLowest,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: AppTheme.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF005C55).withOpacity(0.06),
                    blurRadius: 40,
                    offset: const Offset(0, 8),
                  ),
                ]
              ),
              child: content,
            ),
          ),
        ],
      ),
    );
  }
}
