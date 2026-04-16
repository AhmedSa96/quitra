import 'package:flutter/material.dart';
import 'package:quitra/l10n/app_localizations.dart';
import 'package:solar_icons/solar_icons.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/presentation/widgets/sanctuary_card.dart';
import 'daily_check_in_dialog.dart';

class DailyCheckInCard extends StatelessWidget {
  const DailyCheckInCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
      child: GestureDetector(
        onTap: () => DailyCheckInDialog.show(context),
        child: SanctuaryCard(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.howWasYourDay,
                      style: Theme.of(context).textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      l10n.homeDashboardDescription,
                      style: Theme.of(context).textTheme.bodySmall
                          ?.copyWith(
                            color: AppTheme.onSurfaceVariant,
                            height: 1.4,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              const Icon(
                SolarIconsOutline.calendarMinimalistic,
                color: AppTheme.primary,
                size: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
