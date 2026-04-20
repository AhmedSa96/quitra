import 'package:freezed_annotation/freezed_annotation.dart';

part 'journey_event.freezed.dart';

@freezed
abstract class JourneyEvent with _$JourneyEvent {
  const factory JourneyEvent.loadHistory() = LoadHistory;
  const factory JourneyEvent.updateDay({
    required DateTime date,
    bool? wasSmoked,
    int? cravingLevel,
    String? note,
  }) = UpdateDay;
}
