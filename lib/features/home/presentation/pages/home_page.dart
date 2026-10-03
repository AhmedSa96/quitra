import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../widgets/home_action_section.dart';
import '../widgets/home_header.dart';
import '../widgets/streak_hero_card.dart';
import '../../../milestones/presentation/widgets/milestone_unlock_sheet.dart';

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
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is Loaded && state.newlyUnlockedMilestone != null) {
          MilestoneUnlockSheet.show(context, state.newlyUnlockedMilestone!);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(),
              if (state is Loaded)
                StreakHeroCard(
                  streak: state.streak,
                  stats: state.stats,
                  journeyHistory: state.journeyHistory,
                ),
              const SizedBox(height: 64),
              const HomeActionSection(),
              const SizedBox(height: 32),
            ],
          ),
        );
      },
    );
  }
}
