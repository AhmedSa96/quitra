import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/complete_onboarding_usecase.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';
part 'onboarding_bloc.freezed.dart';

@injectable
class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final CompleteOnboardingUseCase completeOnboarding;

  OnboardingBloc(this.completeOnboarding) : super(const OnboardingState.initial()) {
    on<OnboardingStarted>((event, emit) async {
      emit(const OnboardingState.loading());
      final result = await completeOnboarding(
        cigarettesPerDay: event.cigarettesPerDay,
        yearsSmoking: event.yearsSmoking,
        quitMethod: event.quitMethod,
        quitStartDate: event.quitStartDate,
        cigarettePrice: event.cigarettePrice,
        packetPrice: event.packetPrice,
        cigarettesPerPacket: event.cigarettesPerPacket,
      );
      result.fold(
        (failure) => emit(const OnboardingState.error()),
        (_) => emit(const OnboardingState.success()),
      );
    });
  }
}
