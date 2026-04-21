import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:quitra/l10n/app_localizations.dart';
import 'package:quitra/core/theme/app_theme.dart';
import '../bloc/settings_bloc.dart';
import '../widgets/settings_header.dart';
import '../widgets/settings_group.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.notificationsLabel),
      ),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SettingsHeader(title: l10n.notificationsLabel),
                  const SizedBox(height: 32),
                  SettingsGroup(
                    children: [
                      _buildSwitchTile(
                        context: context,
                        title: l10n.dailyReminderLabel,
                        subtitle: l10n.dailyReminderDescription,
                        value: state.dailyReminderEnabled,
                        onChanged: (value) {
                          context.read<SettingsBloc>().add(DailyReminderToggled(value));
                        },
                      ),
                      if (state.dailyReminderEnabled)
                        _buildTimeTile(
                          context: context,
                          title: l10n.reminderTimeLabel,
                          time: state.dailyReminderTime ?? const TimeOfDay(hour: 9, minute: 0),
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SettingsGroup(
                    children: [
                      _buildSwitchTile(
                        context: context,
                        title: l10n.milestoneCelebrationsLabel,
                        subtitle: l10n.milestoneCelebrationsDescription,
                        value: state.milestoneCelebrationsEnabled,
                        onChanged: (value) {
                          context.read<SettingsBloc>().add(MilestoneCelebrationsToggled(value));
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSwitchTile({
    required BuildContext context,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Text(
          subtitle,
          style: TextStyle(
            fontSize: 13,
            color: AppTheme.onSurfaceVariant.withValues(alpha: 0.7),
          ),
        ),
      ),
      trailing: Switch.adaptive(
        value: value,
        onChanged: onChanged,
        activeTrackColor: AppTheme.primary,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    );
  }

  Widget _buildTimeTile({
    required BuildContext context,
    required String title,
    required TimeOfDay time,
  }) {
    final formattedTime = time.format(context);
    
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppTheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(SolarIconsOutline.clockCircle, color: AppTheme.onSurface, size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
      trailing: Text(
        formattedTime,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: AppTheme.primary,
        ),
      ),
      onTap: () => _showTimePicker(context, time),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    );
  }

  Future<void> _showTimePicker(BuildContext context, TimeOfDay currentTime) async {
    final time = await showTimePicker(
      context: context,
      initialTime: currentTime,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: AppTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (time != null && context.mounted) {
      context.read<SettingsBloc>().add(DailyReminderTimeChanged(time));
    }
  }
}