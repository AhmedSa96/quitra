import 'package:flutter/material.dart';
import 'package:quitra/l10n/app_localizations.dart';
import 'package:solar_icons/solar_icons.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/presentation/widgets/sanctuary_card.dart';
import '../../../../core/presentation/widgets/pill_button.dart';
import '../../../../core/presentation/widgets/stat_item.dart';
import '../../../../core/di/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()..add(const HomeEvent.loadStats()),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

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
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    final daysCount = state.maybeWhen(
                      loaded: (stats) => stats.daysSmokeFree,
                      orElse: () => 0,
                    );
                    return Text(
                      l10n.homeGreeting(daysCount),
                      style: Theme.of(context).textTheme.displayLarge,
                    );
                  },
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
                context.read<HomeBloc>().add(const HomeEvent.logCraving());
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Craving logged! Breathe deeply.')),
                );
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
