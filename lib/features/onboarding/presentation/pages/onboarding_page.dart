import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../bloc/onboarding_bloc.dart';

import '../widgets/cigarettes_step.dart';
import '../widgets/years_smoking_step.dart';
import '../widgets/quit_method_step.dart';
import '../widgets/quit_date_step.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();

  int _currentPage = 0;
  int _cigarettesPerDay = 10;
  int _yearsSmoking = 5;
  String _quitMethod = 'cold_turkey';
  DateTime _quitStartDate = DateTime.now();

  void _nextPage() {
    if (_currentPage == 3) {
      context.read<OnboardingBloc>().add(
        OnboardingStarted(
          cigarettesPerDay: _cigarettesPerDay,
          yearsSmoking: _yearsSmoking,
          quitMethod: _quitMethod,
          quitStartDate: _quitStartDate,
        ),
      );
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surface,
      body: SafeArea(
        child: BlocConsumer<OnboardingBloc, OnboardingState>(
          listener: (context, state) {
            state.maybeWhen(
              success: () => context.go('/home'),
              error: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Failed to complete onboarding. Please try again.',
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return Stack(
              children: [
                Column(
                  children: [
                    _buildHeader(),
                    Expanded(
                      child: Center(
                        child: PageView(
                          controller: _pageController,
                          physics:
                              const NeverScrollableScrollPhysics(), // Disable swipe
                          onPageChanged: (index) {
                            setState(() {
                              _currentPage = index;
                            });
                          },
                          children: [
                            Center(
                              child: CigarettesStep(
                                value: _cigarettesPerDay,
                                onChanged: (val) =>
                                    setState(() => _cigarettesPerDay = val),
                              ),
                            ),
                            Center(
                              child: YearsSmokingStep(
                                value: _yearsSmoking,
                                onChanged: (val) =>
                                    setState(() => _yearsSmoking = val),
                              ),
                            ),
                            Center(
                              child: QuitMethodStep(
                                value: _quitMethod,
                                onChanged: (val) =>
                                    setState(() => _quitMethod = val),
                              ),
                            ),
                            Center(
                              child: QuitDateStep(
                                value: _quitStartDate,
                                onChanged: (val) =>
                                    setState(() => _quitStartDate = val),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    _buildBottomControls(),
                  ],
                ),
                if (state.maybeWhen(loading: () => true, orElse: () => false))
                  Container(
                    color: Colors.black.withValues(alpha: 0.3),
                    child: const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppTheme.primary,
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Step ${_currentPage + 1} of 4',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: AppTheme.onSurfaceVariant,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          Row(
            children: List.generate(4, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.only(left: 8.0),
                height: 8,
                width: _currentPage == index ? 24 : 8,
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? AppTheme.primary
                      : AppTheme.primary.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomControls() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: AppTheme.signatureGradient,
          borderRadius: BorderRadius.circular(999),
        ),
        child: ElevatedButton(
          onPressed: _nextPage,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            minimumSize: const Size(double.infinity, 56),
          ),
          child: const Text(
            'Continue',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
