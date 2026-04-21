import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quitra/core/theme/app_theme.dart';
import 'package:quitra/l10n/app_localizations.dart';
import 'package:solar_icons/solar_icons.dart';
import '../bloc/settings_bloc.dart';

class LanguagePickerDialog extends StatelessWidget {
  const LanguagePickerDialog({super.key});

  static const _languages = [
    _LanguageOption(locale: Locale('ar'), flag: '🇸🇦'),
    _LanguageOption(locale: Locale('en'), flag: '🇬🇧'),
    _LanguageOption(locale: Locale('tr'), flag: '🇹🇷'),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final currentLocale = Localizations.localeOf(context);

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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.languageLabel,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 24,
                    ),
              ),
              const SizedBox(height: 24),
              ..._languages.map((lang) => _buildLanguageOption(
                    context,
                    lang: lang,
                    localeName: _getLanguageName(l10n, lang.locale.languageCode),
                    isSelected: currentLocale.languageCode == lang.locale.languageCode,
                    onTap: () {
                      context.read<SettingsBloc>().add(LocaleChanged(lang.locale));
                      Navigator.of(context).pop();
                    },
                  )),
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
          ),
        ),
      ),
    );
  }

  String _getLanguageName(AppLocalizations l10n, String code) {
    switch (code) {
      case 'ar':
        return l10n.arabic;
      case 'en':
        return l10n.english;
      case 'tr':
        return l10n.turkish;
      default:
        return code;
    }
  }

  Widget _buildLanguageOption(
    BuildContext context, {
    required _LanguageOption lang,
    required String localeName,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.primary.withValues(alpha: 0.1) : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? AppTheme.primary : AppTheme.primary.withValues(alpha: 0.1),
              width: 2,
            ),
          ),
          child: Row(
            children: [
              Text(
                lang.flag,
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  localeName,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                        color: isSelected ? AppTheme.primary : AppTheme.onSurface,
                      ),
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
      ),
    );
  }
}

class _LanguageOption {
  final Locale locale;
  final String flag;

  const _LanguageOption({required this.locale, required this.flag});
}
