part of 'onboarding_bloc.dart';

@freezed
abstract class OnboardingEvent with _$OnboardingEvent {
  const factory OnboardingEvent.started({
    required int cigarettesPerDay,
    required int yearsSmoking,
    required String quitMethod,
    required DateTime quitStartDate,
    double? cigarettePrice,
    double? packetPrice,
    int? cigarettesPerPacket,
  }) = OnboardingStarted;
}
