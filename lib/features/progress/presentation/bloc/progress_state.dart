import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/progress_stats.dart';
import '../../../milestones/domain/entities/milestone.dart';

part 'progress_state.freezed.dart';

@freezed
abstract class ProgressState with _$ProgressState {
  const factory ProgressState.initial() = Initial;
  const factory ProgressState.loading() = Loading;
  const factory ProgressState.loaded({
    required ProgressStats stats,
    @Default([]) List<Milestone> milestones,
  }) = Loaded;
  const factory ProgressState.error(String message) = Error;
}
