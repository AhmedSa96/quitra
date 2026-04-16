import 'package:freezed_annotation/freezed_annotation.dart';

part 'journey_event.freezed.dart';

@freezed
abstract class JourneyEvent with _$JourneyEvent {
  const factory JourneyEvent.loadHistory() = LoadHistory;
}
