import 'package:freezed_annotation/freezed_annotation.dart';

part 'today_check_in_status.freezed.dart';

@freezed
class TodayCheckInStatus with _$TodayCheckInStatus {
  const factory TodayCheckInStatus({
    required bool hasCheckedIn,
    required bool wasSmoked,
    required int cravingLevel,
    required int notesCount,
  }) = _TodayCheckInStatus;
}
