import 'package:flutter/material.dart';
import 'package:quitra/core/di/injection.dart';
import 'package:quitra/core/theme/app_theme.dart';
import 'package:quitra/features/onboarding/data/datasources/onboarding_local_data_source.dart';
import 'package:quitra/features/onboarding/data/models/user_profile_isar.dart';
import 'package:quitra/l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:solar_icons/solar_icons.dart';

class QuitPlanDialog extends StatefulWidget {
  const QuitPlanDialog({super.key});

  @override
  State<QuitPlanDialog> createState() => _QuitPlanDialogState();
}

class _QuitPlanDialogState extends State<QuitPlanDialog> {
  String _quitMethod = 'cold_turkey';
  DateTime? _quitStartDate;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final dataSource = getIt<OnboardingLocalDataSource>();
    final profile = await dataSource.getUserProfile();
    if (profile != null && mounted) {
      setState(() {
        _quitMethod = profile.quitMethod;
        _quitStartDate = profile.quitStartDate;
        _isLoading = false;
      });
    } else if (mounted) {
      setState(() {
        _quitStartDate = DateTime.now();
        _isLoading = false;
      });
    }
  }

  Future<void> _saveProfile() async {
    if (_quitStartDate == null) return;

    final dataSource = getIt<OnboardingLocalDataSource>();
    final existingProfile = await dataSource.getUserProfile();

    final profile = existingProfile ?? UserProfileIsar()
      ..cigarettesPerDay = 10
      ..yearsSmoking = 1
      ..quitMethod = _quitMethod
      ..quitStartDate = _quitStartDate!;

    profile.quitMethod = _quitMethod;
    profile.quitStartDate = _quitStartDate!;

    await dataSource.saveUserProfile(profile);

    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).toString();

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
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.quitPlanLabel,
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontSize: 24,
                          ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      l10n.quitMethodQuestion,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    _buildMethodOption(
                      context,
                      'cold_turkey',
                      l10n.coldTurkeyTitle,
                      l10n.coldTurkeyDescription,
                      Icons.wb_sunny,
                    ),
                    const SizedBox(height: 12),
                    _buildMethodOption(
                      context,
                      'gradual',
                      l10n.gradualTitle,
                      l10n.gradualDescription,
                      Icons.trending_down,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      l10n.quitDateQuestion,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    InkWell(
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: _quitStartDate ?? DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (date != null && mounted) {
                          setState(() => _quitStartDate = date);
                        }
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppTheme.surfaceContainerLow,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _quitStartDate != null
                                  ? DateFormat.yMd(locale).format(_quitStartDate!)
                                  : '-',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppTheme.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Icon(
                              SolarIconsBold.calendar,
                              color: AppTheme.primary,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      child: GestureDetector(
                        onTap: _saveProfile,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            gradient: AppTheme.signatureGradient,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text(
                              l10n.saveAction,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
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
    final isSelected = _quitMethod == optionValue;
    return InkWell(
      onTap: () => setState(() => _quitMethod = optionValue),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.surfaceContainerLow : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppTheme.primary : AppTheme.primary.withValues(alpha: 0.2),
            width: 2,
          ),
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
                size: 20,
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
                          fontWeight: FontWeight.bold,
                          color: isSelected ? AppTheme.primary : AppTheme.onSurface,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppTheme.onSurfaceVariant,
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