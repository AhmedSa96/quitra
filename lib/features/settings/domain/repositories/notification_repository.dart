import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:quitra/core/error/failures.dart';
import '../../data/datasources/notification_local_data_source.dart';

abstract class NotificationRepository {
  Future<Either<Failure, NotificationSettingsEntity>> getNotificationSettings();
  Future<Either<Failure, Unit>> updateNotificationSettings(NotificationSettingsEntity settings);
  Future<Either<Failure, Unit>> scheduleDailyReminder({
    required TimeOfDay time,
    required String title,
    required String body,
  });
  Future<Either<Failure, Unit>> cancelDailyReminder();
  Future<Either<Failure, Unit>> showMilestoneNotification({
    required int days,
    required String title,
    required String body,
  });
}