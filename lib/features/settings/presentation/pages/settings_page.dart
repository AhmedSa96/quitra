import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:quitra/l10n/app_localizations.dart';
import '../widgets/settings_header.dart';
import '../widgets/profile_summary_card.dart';
import '../widgets/settings_group.dart';
import '../widgets/settings_tile.dart';
import '../widgets/settings_version_footer.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SettingsHeader(title: l10n.settingsTitle),
            const SizedBox(height: 32),
            const ProfileSummaryCard(
              name: "Ahmed Salah",
              membershipStatus: "Premium Member",
            ),
            const SizedBox(height: 32),
            SettingsGroup(
              children: [
                SettingsTile(
                  title: l10n.profileLabel,
                  icon: SolarIconsOutline.user,
                  onTap: () => context.push('/profile'),
                ),
                SettingsTile(
                  title: l10n.quitPlanLabel,
                  icon: SolarIconsOutline.route,
                  onTap: () => context.push('/quit-plan'),
                ),
                SettingsTile(
                  title: l10n.notificationsLabel,
                  icon: SolarIconsOutline.bell,
                  onTap: () => context.push('/notifications'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SettingsGroup(
              children: [
                SettingsTile(
                  title: l10n.subscriptionLabel,
                  icon: SolarIconsOutline.star,
                  onTap: () => context.push('/subscription'),
                ),
                SettingsTile(
                  title: l10n.privacyPolicyLabel,
                  icon: SolarIconsOutline.shieldKeyhole,
                  onTap: () => context.push('/privacy-policy'),
                ),
              ],
            ),
            const SizedBox(height: 48),
            SettingsVersionFooter(
              appName: l10n.appName,
              version: l10n.appVersion,
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
