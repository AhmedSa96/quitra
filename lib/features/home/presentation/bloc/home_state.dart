import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_stats.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState.initial() = Initial;
  const factory HomeState.loading() = Loading;
  const factory HomeState.loaded(UserStats stats) = Loaded;
  const factory HomeState.error(String message) = Error;
}
