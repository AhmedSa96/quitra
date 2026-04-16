import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.freezed.dart';

@freezed
abstract class HomeEvent with _$HomeEvent {
  const factory HomeEvent.loadStats() = LoadStats;
  const factory HomeEvent.logCraving({required bool wasSmoked}) = LogCraving;
  const factory HomeEvent.saveDailyCheckIn({
    required bool wasSmoked,
    required int cravingLevel,
    String? note,
  }) = SaveDailyCheckIn;
}
