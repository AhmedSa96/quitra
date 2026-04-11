import 'package:flutter/material.dart';
import 'package:quitra/l10n/app_localizations.dart';
import 'package:solar_icons/solar_icons.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/presentation/widgets/sanctuary_card.dart';
import '../../../../core/presentation/widgets/pill_button.dart';
import '../../../../core/presentation/widgets/stat_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section: Top-aligned editorial greeting
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 32, 24, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.homeGreeting(5), // TODO: Link to actual data
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.homeWelcome,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppTheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),

          // Primary CTA: The Craving Button (Signature Gradient)
          Center(
            child: PillButton(
              label: l10n.craveButton,
              onPressed: () {
                // TODO: Trigger Craving Relief Flow
              },
              icon: SolarIconsBold.fire,
            ),
          ),

          const SizedBox(height: 48),

          // Stats Bar: No-line rule applied via background color shift
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
            decoration: const BoxDecoration(
              color: AppTheme.surfaceContainerLow,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: StatItem(
                    label: l10n.moneySavedLabel,
                    value: "\$142",
                    icon: SolarIconsOutline.walletMoney,
                  ),
                ),
                Expanded(
                  child: StatItem(
                    label: l10n.cigsAvoidedLabel,
                    value: "84",
                    icon: SolarIconsOutline.maskHapply,
                  ),
                ),
                Expanded(
                  child: StatItem(
                    label: l10n.timeSmokeFreeLabel,
                    value: "5d",
                    icon: SolarIconsOutline.clockCircle,
                  ),
                ),
              ],
            ),
          ),

          // Secondary Action: Daily Check-in sanctuary card
          Padding(
            padding: const EdgeInsets.all(24.0),
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

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
