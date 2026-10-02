import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_stats.dart';
import '../../../streak/domain/entities/streak.dart';
import '../../../milestones/domain/entities/milestone.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState.initial() = Initial;
  const factory HomeState.loading() = Loading;
  const factory HomeState.loaded({
    required UserStats stats,
    required Streak streak,
    Milestone? newlyUnlockedMilestone,
  }) = Loaded;
  const factory HomeState.error(String message) = Error;
}
