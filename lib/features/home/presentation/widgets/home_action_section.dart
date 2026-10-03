import 'package:flutter/material.dart';
import 'package:quitra/l10n/app_localizations.dart';
import 'package:solar_icons/solar_icons.dart';
import '../../../../core/presentation/widgets/pill_button.dart';
import 'daily_check_in_dialog.dart';

class HomeActionSection extends StatelessWidget {
  const HomeActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: PillButton(
        label: l10n.howWasYourDay,
        onPressed: () => DailyCheckInDialog.show(context),
        icon: SolarIconsOutline.notes,
      ),
    );
  }
}
