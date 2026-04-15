import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quitra/l10n/app_localizations.dart';
import '../../../../core/theme/app_theme.dart';
import '../bloc/onboarding_bloc.dart';

import '../widgets/cigarettes_step.dart';
import '../widgets/years_smoking_step.dart';
import '../widgets/quit_method_step.dart';
import '../widgets/quit_date_step.dart';
import '../widgets/cigarette_price_step.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();

  static const int _totalSteps = 5;

  int _currentPage = 0;
  int _cigarettesPerDay = 10;
  int _yearsSmoking = 5;
  String _quitMethod = 'cold_turkey';
  DateTime _quitStartDate = DateTime.now();

  bool _isPacketPrice = false;
  String _cigarettePriceStr = '';
  String _packetPriceStr = '';
  String _cigarettesPerPacketStr = '';

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _nextPage() {
    if (_currentPage == _totalSteps - 1) {
      double? cigPrice = _cigarettePriceStr.isNotEmpty ? double.tryParse(_cigarettePriceStr) : null;
      double? packPrice = _packetPriceStr.isNotEmpty ? double.tryParse(_packetPriceStr) : null;
      int? cigsPerPack = _cigarettesPerPacketStr.isNotEmpty ? int.tryParse(_cigarettesPerPacketStr) : null;

      context.read<OnboardingBloc>().add(
        OnboardingStarted(
          cigarettesPerDay: _cigarettesPerDay,
          yearsSmoking: _yearsSmoking,
          quitMethod: _quitMethod,
          quitStartDate: _quitStartDate,
          cigarettePrice: cigPrice,
          packetPrice: packPrice,
          cigarettesPerPacket: cigsPerPack,
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
                  SnackBar(
                    content: Text('Something went wrong'),
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
                            Center(
                              child: CigarettePriceStep(
                                isPacket: _isPacketPrice,
                                cigarettePriceStr: _cigarettePriceStr,
                                packetPriceStr: _packetPriceStr,
                                cigarettesPerPacketStr: _cigarettesPerPacketStr,
                                onTypeChanged: (val) => setState(() => _isPacketPrice = val),
                                onCigarettePriceChanged: (val) => setState(() => _cigarettePriceStr = val),
                                onPacketPriceChanged: (val) => setState(() => _packetPriceStr = val),
                                onCigarettesPerPacketChanged: (val) => setState(() => _cigarettesPerPacketStr = val),
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
          Row(
            children: [
              if (_currentPage > 0)
                IconButton(
                  onPressed: _previousPage,
                  icon: const Icon(Icons.arrow_back_ios, size: 20),
                  color: AppTheme.onSurfaceVariant,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              if (_currentPage > 0) const SizedBox(width: 12),
              Text(
                AppLocalizations.of(
                  context,
                )!.stepProgress(_currentPage + 1, _totalSteps),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppTheme.onSurfaceVariant,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          Row(
            children: List.generate(_totalSteps, (index) {
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
    final isLoading = context.watch<OnboardingBloc>().state.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Opacity(
        opacity: isLoading ? 0.6 : 1.0,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: AppTheme.signatureGradient,
            borderRadius: BorderRadius.circular(999),
          ),
          child: ElevatedButton(
            onPressed: isLoading ? null : _nextPage,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              minimumSize: const Size(double.infinity, 56),
            ),
            child: isLoading
                ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : Text(
                    AppLocalizations.of(context)!.continueButton,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
          ),
        ),
      ),
    );
  }
}
