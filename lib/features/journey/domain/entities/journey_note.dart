import 'package:freezed_annotation/freezed_annotation.dart';

part 'journey_note.freezed.dart';

@freezed
class JourneyNote with _$JourneyNote {
  const factory JourneyNote({
    required int id,
    required DateTime createdAt,
    required String text,
  }) = _JourneyNote;
}
