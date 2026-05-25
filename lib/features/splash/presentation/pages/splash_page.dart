import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quitra/core/services/ad_service.dart';
import 'package:quitra/features/onboarding/domain/repositories/onboarding_repository.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/di/injection.dart';
import 'package:quitra/l10n/app_localizations.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();

    AdService.loadRewardedAd();

    _navigateToNext();
  }

  Future<void> _navigateToNext() async {
    // Wait for the splash animation
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      final repository = getIt<OnboardingRepository>();
      final result = await repository.isOnboardingCompleted();

      result.fold(
        (failure) =>
            context.go('/onboarding'), // Default to onboarding on error
        (isCompleted) {
          if (isCompleted) {
            context.go('/home');
          } else {
            context.go('/onboarding');
          }
        },
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppTheme.signatureGradient),
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Signature Card for the Logo
                Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceContainerLowest.withValues(
                      alpha: 0.9,
                    ),
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF005C55).withValues(alpha: 0.12),
                        blurRadius: 40,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/brand/logo.png',
                    width: 120,
                    height: 120,
                  ),
                ),
                const SizedBox(height: 24),

                Text(
                  AppLocalizations.of(context)!.digitalSanctuary,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    letterSpacing: 8,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  AppLocalizations.of(context)!.appVersion,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Colors.white.withValues(alpha: 0.7),
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
