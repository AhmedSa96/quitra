import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../../../journey/domain/repositories/journey_repository.dart';
import '../../../journey/domain/entities/journey_day.dart';
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

class _HomeView extends StatefulWidget {
  const _HomeView();

  @override
  State<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView> {
  List<JourneyDay> _history = [];

  @override
  void initState() {
    super.initState();
    _loadJourneyHistory();
  }

  Future<void> _loadJourneyHistory() async {
    final journeyRepo = getIt<JourneyRepository>();
    final result = await journeyRepo.getJourneyHistory();
    result.fold((_) {}, (history) {
      if (mounted) setState(() => _history = history);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is Loaded) {
          _loadJourneyHistory();
          if (state.newlyUnlockedMilestone != null) {
            MilestoneUnlockSheet.show(context, state.newlyUnlockedMilestone!);
          }
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
                  journeyHistory: _history,
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
