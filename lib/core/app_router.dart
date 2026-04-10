import 'package:go_router/go_router.dart';
import '../features/onboarding/presentation/pages/onboarding_page.dart';
import '../features/splash/presentation/pages/splash_page.dart';
import '../features/home/presentation/pages/home_page.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
  ],
);
