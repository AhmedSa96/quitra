import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/journey_day.dart';

part 'journey_state.freezed.dart';

@freezed
abstract class JourneyState with _$JourneyState {
  const factory JourneyState.initial() = _Initial;
  const factory JourneyState.loading() = _Loading;
  const factory JourneyState.loaded(List<JourneyDay> history) = _Loaded;
  const factory JourneyState.error(String message) = _Error;
}
