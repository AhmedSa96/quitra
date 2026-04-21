import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/progress_stats.dart';

part 'progress_state.freezed.dart';

@freezed
abstract class ProgressState with _$ProgressState {
  const factory ProgressState.initial() = Initial;
  const factory ProgressState.loading() = Loading;
  const factory ProgressState.loaded(ProgressStats stats) = Loaded;
  const factory ProgressState.error(String message) = Error;
}
