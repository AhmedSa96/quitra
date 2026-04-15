import 'package:flutter/material.dart';
import '../../../../core/di/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../widgets/home_header.dart';
import '../widgets/home_action_section.dart';
import '../widgets/home_stats_bar.dart';
import '../widgets/daily_check_in_card.dart';

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
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeHeader(),
          HomeActionSection(),
          SizedBox(height: 48),
          HomeStatsBar(),
          DailyCheckInCard(),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}
