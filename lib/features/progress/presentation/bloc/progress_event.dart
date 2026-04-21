import 'package:freezed_annotation/freezed_annotation.dart';

part 'progress_event.freezed.dart';

@freezed
abstract class ProgressEvent with _$ProgressEvent {
  const factory ProgressEvent.loadProgress() = LoadProgress;
}
