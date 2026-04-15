import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quitra/l10n/app_localizations.dart';
import 'package:solar_icons/solar_icons.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/presentation/widgets/pill_button.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import 'craving_outcome_dialog.dart';

class HomeActionSection extends StatelessWidget {
  const HomeActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Center(
      child: PillButton(
        label: l10n.craveButton,
        onPressed: () async {
          final bool? wasSmoked = await showDialog<bool>(
            context: context,
            builder: (context) => const CravingOutcomeDialog(),
          );

          if (wasSmoked != null && context.mounted) {
            context.read<HomeBloc>().add(HomeEvent.logCraving(wasSmoked: wasSmoked));
            
            if (wasSmoked) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(l10n.setbackStatus),
                  backgroundColor: AppTheme.onSurfaceVariant,
                ),
              );
            }
          }
        },
        icon: SolarIconsBold.fire,
      ),
    );
  }
}
