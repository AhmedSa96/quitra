import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:quitra/l10n/app_localizations.dart';
import '../bloc/settings_bloc.dart';
import '../widgets/settings_header.dart';
import '../widgets/settings_group.dart';
import '../widgets/settings_tile.dart';
import '../widgets/settings_version_footer.dart';
import '../widgets/language_picker_dialog.dart';
import '../widgets/quit_plan_dialog.dart';
import '../widgets/cigarette_price_dialog.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocListener<SettingsBloc, SettingsState>(
      listenWhen: (previous, current) =>
          (previous.isExporting && !current.isExporting) ||
          (previous.exportFailure != current.exportFailure),
      listener: (context, state) {
        if (!state.isExporting) {
          if (state.exportFailure != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(l10n.exportDataError),
                backgroundColor: Colors.redAccent,
              ),
            );
          } else if (state.isExporting == false &&
              state.exportFailure == null) {
            // Note: success is handled by the share sheet appearing usually,
            // but we can show a toast if needed.
          }
        }
      },
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SettingsHeader(title: l10n.settingsTitle),
              const SizedBox(height: 32),
              SettingsGroup(
                children: [
                  SettingsTile(
                    title: l10n.languageLabel,
                    icon: SolarIconsOutline.global,
                    onTap: () => _showLanguagePicker(context),
                  ),
                  SettingsTile(
                    title: l10n.quitPlanLabel,
                    icon: SolarIconsOutline.route,
                    onTap: () => _showQuitPlanDialog(context),
                  ),
                  SettingsTile(
                    title: l10n.cigarettePriceLabel,
                    icon: SolarIconsOutline.walletMoney,
                    onTap: () => _showCigarettePriceDialog(context),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SettingsGroup(
                children: [
                  SettingsTile(
                    title: l10n.notificationsLabel,
                    icon: SolarIconsOutline.bell,
                    onTap: () => context.push('/notifications'),
                  ),
                  SettingsTile(
                    title: l10n.privacyPolicyLabel,
                    icon: SolarIconsOutline.shieldKeyhole,
                    onTap: () => context.push('/privacy-policy'),
                  ),
                  BlocBuilder<SettingsBloc, SettingsState>(
                    builder: (context, state) {
                      return SettingsTile(
                        title: l10n.exportDataLabel,
                        icon: state.isExporting
                            ? SolarIconsOutline.reorder
                            : SolarIconsOutline.export,
                        onTap: state.isExporting
                            ? null
                            : () => context.read<SettingsBloc>().add(
                                ExportDataRequested(),
                              ),
                      );
                    },
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
      ),
    );
  }

  void _showLanguagePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const LanguagePickerDialog(),
    );
  }

  void _showQuitPlanDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => const QuitPlanDialog());
  }

  void _showCigarettePriceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const CigarettePriceDialog(),
    );
  }
}
