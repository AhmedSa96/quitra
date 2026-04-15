import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quitra/l10n/app_localizations.dart';
import 'package:solar_icons/solar_icons.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/presentation/widgets/stat_item.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';

class HomeStatsBar extends StatelessWidget {
  const HomeStatsBar({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      decoration: const BoxDecoration(
        color: AppTheme.surfaceContainerLow,
      ),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (stats) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: StatItem(
                      label: l10n.moneySavedLabel,
                      value: "\$${stats.moneySaved.toStringAsFixed(0)}",
                      icon: SolarIconsOutline.walletMoney,
                    ),
                  ),
                  Expanded(
                    child: StatItem(
                      label: l10n.cigsAvoidedLabel,
                      value: "${stats.cigarettesAvoided}",
                      icon: SolarIconsOutline.maskHapply,
                    ),
                  ),
                  Expanded(
                    child: StatItem(
                      label: l10n.timeSmokeFreeLabel,
                      value: "${stats.daysSmokeFree}d",
                      icon: SolarIconsOutline.clockCircle,
                    ),
                  ),
                ],
              );
            },
            orElse: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
