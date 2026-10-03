import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quitra/core/theme/app_theme.dart';
import 'package:quitra/l10n/app_localizations.dart';
import 'package:solar_icons/solar_icons.dart';
import '../../../../core/presentation/widgets/pill_button.dart';
import '../bloc/home_bloc.dart';
import 'daily_check_in_dialog.dart';
import 'quick_note_sheet.dart';
import 'setback_support_sheet.dart';

class HomeActionSection extends StatelessWidget {
  const HomeActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final homeState = context.watch<HomeBloc>().state;
    final hasCheckedIn = homeState.maybeWhen(
      loaded: (stats, streak, journeyHistory, newlyUnlockedMilestone, todayStatus) => todayStatus?.hasCheckedIn ?? false,
      orElse: () => false,
    );

    if (hasCheckedIn) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PillButton(
              label: l10n.appendNote,
              onPressed: () => QuickNoteSheet.show(context),
              icon: SolarIconsOutline.pen,
            ),
            const SizedBox(height: 12),
            TextButton.icon(
              onPressed: () => SetbackSupportSheet.show(context),
              icon: const Icon(SolarIconsOutline.fire, size: 18),
              label: Text(l10n.iSmoked),
              style: TextButton.styleFrom(
                foregroundColor: AppTheme.onSurfaceVariant.withValues(alpha: 0.8),
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Center(
      child: PillButton(
        label: l10n.howWasYourDay,
        onPressed: () => DailyCheckInDialog.show(context),
        icon: SolarIconsOutline.notes,
      ),
    );
  }
}
