part of 'onboarding_bloc.dart';

@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState.initial() = OnboardingInitial;
  const factory OnboardingState.loading() = OnboardingLoading;
  const factory OnboardingState.success() = OnboardingSuccess;
  const factory OnboardingState.error() = OnboardingError;
}
