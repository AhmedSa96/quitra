import 'package:freezed_annotation/freezed_annotation.dart';

part 'milestone.freezed.dart';

enum MilestoneCategory {
  time,
  healthRecovery,
  savings,
  consistency,
  strength,
  dedication,
}

@freezed
abstract class Milestone with _$Milestone {
  const factory Milestone({
    required String id,
    required String titleKey,
    required String descriptionKey,
    required MilestoneCategory category,
    required String iconName,
    required double threshold,
    required bool isUnlocked,
    DateTime? unlockedAt,
  }) = _Milestone;
}
