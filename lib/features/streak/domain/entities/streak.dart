import 'package:freezed_annotation/freezed_annotation.dart';

part 'streak.freezed.dart';

enum StreakMode { strict, forgiving }

@freezed
abstract class Streak with _$Streak {
  const factory Streak({
    required int currentCount,
    required int longestCount,
    required DateTime? lastCheckInDate,
    required StreakMode mode,
    @Default(false) bool forgivenessUsedThisWeek,
  }) = _Streak;
}
