import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quitra/l10n/app_localizations.dart';
import '../../../../core/theme/app_theme.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Padding(
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
    );
  }
}
