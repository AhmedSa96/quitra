import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../features/onboarding/presentation/pages/onboarding_page.dart';
import '../features/onboarding/presentation/bloc/onboarding_bloc.dart';
import '../features/splash/presentation/pages/splash_page.dart';
import '../features/main/presentation/pages/main_page.dart';
import '../features/journey/domain/entities/journey_day.dart';
import '../features/journey/presentation/pages/journey_day_details_page.dart';
import '../features/journey/presentation/bloc/journey_bloc.dart';
import '../features/settings/presentation/pages/profile_page.dart';
import '../features/settings/presentation/pages/quit_plan_page.dart';
import '../features/settings/presentation/pages/notifications_page.dart';
import '../features/settings/presentation/pages/subscription_page.dart';
import '../features/settings/presentation/pages/privacy_policy_page.dart';
import 'di/injection.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => BlocProvider(
        create: (_) => getIt<OnboardingBloc>(),
        child: const OnboardingPage(),
      ),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const MainPage(),
    ),
    GoRoute(
      path: '/journey-day-details',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        final day = extra['day'] as JourneyDay;
        final bloc = extra['bloc'] as JourneyBloc;
        return BlocProvider.value(
          value: bloc,
          child: JourneyDayDetailsPage(day: day),
        );
      },
    ),
    GoRoute(
      path: '/profile',
      builder: (_, __) => const ProfilePage(),
    ),
    GoRoute(
      path: '/quit-plan',
      builder: (_, __) => const QuitPlanPage(),
    ),
    GoRoute(
      path: '/notifications',
      builder: (_, __) => const NotificationsPage(),
    ),
    GoRoute(
      path: '/subscription',
      builder: (_, __) => const SubscriptionPage(),
    ),
    GoRoute(
      path: '/privacy-policy',
      builder: (_, __) => const PrivacyPolicyPage(),
    ),
  ],
);
