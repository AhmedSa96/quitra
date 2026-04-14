import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_stats.freezed.dart';

@freezed
abstract class UserStats with _$UserStats {
  const factory UserStats({
    required int daysSmokeFree,
    required double moneySaved,
    required int cigarettesAvoided,
    @Default(0) int cravingsLogged,
  }) = _UserStats;
}
