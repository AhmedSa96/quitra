import 'package:freezed_annotation/freezed_annotation.dart';

part 'progress_stats.freezed.dart';

@freezed
abstract class ProgressStats with _$ProgressStats {
  const factory ProgressStats({
    required int daysSmokeFree,
    required double moneySaved,
    required int cigarettesAvoided,
    required int lifeRegainedMinutes,
    required int currentStreak,
    required double heartRateProgress,
    required double circulationProgress,
    required double lungFunctionProgress,
  }) = _ProgressStats;
}