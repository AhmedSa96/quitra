import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quitra/core/services/notification_trigger_service.dart';
import 'package:quitra/features/milestones/domain/entities/milestone.dart';
import 'package:quitra/features/settings/data/datasources/notification_local_data_source.dart';
import 'package:quitra/features/streak/domain/entities/streak.dart';

class MockNotificationDataSource extends Mock implements NotificationLocalDataSource {}

void main() {
  late MockNotificationDataSource mockDataSource;
  late NotificationTriggerService service;

  setUpAll(() {
    registerFallbackValue(const NotificationSettingsEntity());
    registerFallbackValue(const TimeOfDay(hour: 0, minute: 0));
  });

  setUp(() {
    mockDataSource = MockNotificationDataSource();
    service = NotificationTriggerService(mockDataSource);
  });

  test('cancels daily streak reminder when checked in today', () async {
    const streak = Streak(
      currentCount: 3,
      longestCount: 3,
      lastCheckInDate: null,
      mode: StreakMode.strict,
    );

    when(() => mockDataSource.cancelDailyReminder()).thenAnswer((_) async {});

    await service.evaluateStreakReminder(streak: streak, checkedInToday: true);

    verify(() => mockDataSource.cancelDailyReminder()).called(1);
  });

  test('schedules streak reminder when not checked in today', () async {
    const streak = Streak(
      currentCount: 5,
      longestCount: 5,
      lastCheckInDate: null,
      mode: StreakMode.strict,
    );

    when(() => mockDataSource.scheduleDailyReminder(
          time: any(named: 'time'),
          title: any(named: 'title'),
          body: any(named: 'body'),
        )).thenAnswer((_) async {});

    await service.evaluateStreakReminder(streak: streak, checkedInToday: false);

    verify(() => mockDataSource.scheduleDailyReminder(
          time: any(named: 'time'),
          title: any(named: 'title'),
          body: any(named: 'body'),
        )).called(1);
  });

  test('fireMilestoneNotification delegates to showMilestoneNotification', () async {
    const milestone = Milestone(
      id: 'time_7d',
      titleKey: 'One Week',
      descriptionKey: 'Great job!',
      category: MilestoneCategory.time,
      iconName: 'calendarMinimalistic',
      threshold: 7,
      isUnlocked: true,
    );

    when(() => mockDataSource.showMilestoneNotification(
          days: any(named: 'days'),
          title: any(named: 'title'),
          body: any(named: 'body'),
        )).thenAnswer((_) async {});

    await service.fireMilestoneNotification(milestone);

    verify(() => mockDataSource.showMilestoneNotification(
          days: 7,
          title: any(named: 'title'),
          body: any(named: 'body'),
        )).called(1);
  });
}
