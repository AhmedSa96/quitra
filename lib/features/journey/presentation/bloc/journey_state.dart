import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/journey_day.dart';
import '../../../milestones/domain/entities/milestone.dart';

part 'journey_state.freezed.dart';

@freezed
abstract class JourneyState with _$JourneyState {
  const factory JourneyState.initial() = _Initial;
  const factory JourneyState.loading() = _Loading;
  const factory JourneyState.loaded({
    required List<JourneyDay> history,
    @Default([]) List<Milestone> milestones,
    @Default(false) bool hasReachedMax,
    @Default(false) bool isLoadingMore,
  }) = _Loaded;
  const factory JourneyState.error(String message) = _Error;
}
