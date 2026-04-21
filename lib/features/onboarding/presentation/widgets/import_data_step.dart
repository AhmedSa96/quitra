import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:quitra/l10n/app_localizations.dart';
import 'package:quitra/core/theme/app_theme.dart';
import '../bloc/onboarding_bloc.dart';
import './step_container.dart';

class ImportDataStep extends StatelessWidget {
  const ImportDataStep({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return StepContainer(
      title: l10n.onboardingImportTitle,
      content: Column(
        children: [
          Text(
            l10n.onboardingImportDescription,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: AppTheme.onSurfaceVariant.withValues(alpha: 0.8),
            ),
          ),
          const SizedBox(height: 32),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: AppTheme.signatureGradient,
              borderRadius: BorderRadius.circular(16),
            ),
            child: ElevatedButton.icon(
              onPressed: () => _pickAndImportFile(context),
              icon: const Icon(SolarIconsOutline.import, color: Colors.white),
              label: Text(
                l10n.onboardingImportAction,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickAndImportFile(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );

    if (result != null && result.files.single.path != null && context.mounted) {
      context.read<OnboardingBloc>().add(
        OnboardingImportRequested(filePath: result.files.single.path!),
      );
    }
  }
}
