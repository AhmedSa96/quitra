import 'package:freezed_annotation/freezed_annotation.dart';

part 'journey_day.freezed.dart';

enum JourneyStatus { clean, craving, setback }

@freezed
class JourneyDay with _$JourneyDay {
  const factory JourneyDay({
    required DateTime date,
    required JourneyStatus status,
    String? note,
    int? cravingLevel,
  }) = _JourneyDay;
}
