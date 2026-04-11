import 'package:flutter/material.dart';
import 'package:quitra/l10n/app_localizations.dart';
import 'package:solar_icons/solar_icons.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/presentation/widgets/sanctuary_card.dart';

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
            Text(
              l10n.settingsTitle,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 32),
            
            // Profile Summary: Premium editorial header
            SanctuaryCard(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: AppTheme.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(SolarIconsBold.user, color: AppTheme.primary, size: 32),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Ahmed Salem", // TODO: Profile data
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "Premium Member",
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: AppTheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(SolarIconsOutline.pen, size: 18, color: AppTheme.onSurfaceVariant),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Settings Groups: boundaries defined via soft background shifts
            _buildSettingsGroup(context, [
              _buildSettingsTile(context, l10n.profileLabel, SolarIconsOutline.user),
              _buildSettingsTile(context, l10n.quitPlanLabel, SolarIconsOutline.route),
              _buildSettingsTile(context, l10n.notificationsLabel, SolarIconsOutline.bell),
            ]),
            
            const SizedBox(height: 16),
            
            _buildSettingsGroup(context, [
              _buildSettingsTile(context, l10n.subscriptionLabel, SolarIconsOutline.star),
              _buildSettingsTile(context, l10n.privacyPolicyLabel, SolarIconsOutline.shieldKeyhole),
            ]),
            
            const SizedBox(height: 48),
            
            // App Version Footer
            Center(
              child: Text(
                "Quitra v1.0.0",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppTheme.onSurfaceVariant.withValues(alpha: 0.5),
                ),
              ),
            ),
            
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsGroup(BuildContext context, List<Widget> tiles) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceContainerLow.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: tiles,
      ),
    );
  }

  Widget _buildSettingsTile(BuildContext context, String title, IconData icon) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppTheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: AppTheme.onSurface, size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
      trailing: Icon(
        SolarIconsOutline.altArrowRight,
        size: 16,
        color: AppTheme.onSurfaceVariant.withValues(alpha: 0.5),
      ),
      onTap: () {},
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    );
  }
}
