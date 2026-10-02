import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../features/milestones/domain/entities/milestone.dart';
import '../../features/settings/data/datasources/notification_local_data_source.dart';
import '../../features/streak/domain/entities/streak.dart';

@lazySingleton
class NotificationTriggerService {
  final NotificationLocalDataSource notificationDataSource;

  NotificationTriggerService(this.notificationDataSource);

  Future<void> evaluateStreakReminder({
    required Streak streak,
    required bool checkedInToday,
  }) async {
    if (checkedInToday) {
      await notificationDataSource.cancelDailyReminder();
    } else {
      await notificationDataSource.scheduleDailyReminder(
        time: const TimeOfDay(hour: 20, minute: 0),
        title: "Don't forget to check in",
        body: "Your ${streak.currentCount}-day streak matters. Take a moment to check in.",
      );
    }
  }

  Future<void> fireMilestoneNotification(Milestone milestone) async {
    await notificationDataSource.showMilestoneNotification(
      days: milestone.threshold.toInt(),
      title: "${milestone.titleKey} ✓",
      body: milestone.descriptionKey,
    );
  }

  Future<void> evaluateCravingPattern(List<DateTime> recentCravingTimestamps) async {
    if (recentCravingTimestamps.length < 2) return;
    final hourCounts = <int, int>{};
    for (final time in recentCravingTimestamps) {
      final bucket = time.hour ~/ 2;
      hourCounts[bucket] = (hourCounts[bucket] ?? 0) + 1;
    }
    for (final entry in hourCounts.entries) {
      if (entry.value >= 2) {
        final targetHour = (entry.key * 2) - 1;
        if (targetHour >= 0) {
          // high craving window identified
        }
      }
    }
  }
}
