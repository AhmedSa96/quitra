import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:quitra/core/error/failures.dart';
import '../../data/datasources/notification_local_data_source.dart';
import '../../domain/repositories/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationLocalDataSource localDataSource;

  NotificationRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, NotificationSettingsEntity>> getNotificationSettings() async {
    try {
      final settings = await localDataSource.getNotificationSettings();
      return Right(settings);
    } catch (e) {
      return Left(Failure.cacheError());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateNotificationSettings(NotificationSettingsEntity settings) async {
    try {
      await localDataSource.saveNotificationSettings(settings);
      if (settings.dailyReminderEnabled && settings.dailyReminderTime != null) {
        await localDataSource.scheduleDailyReminder(settings.dailyReminderTime!);
      } else {
        await localDataSource.cancelDailyReminder();
      }
      return const Right(unit);
    } catch (e) {
      return Left(Failure.cacheError());
    }
  }

  @override
  Future<Either<Failure, Unit>> scheduleDailyReminder(TimeOfDay time) async {
    try {
      await localDataSource.scheduleDailyReminder(time);
      return const Right(unit);
    } catch (e) {
      return Left(Failure.cacheError());
    }
  }

  @override
  Future<Either<Failure, Unit>> cancelDailyReminder() async {
    try {
      await localDataSource.cancelDailyReminder();
      return const Right(unit);
    } catch (e) {
      return Left(Failure.cacheError());
    }
  }

  @override
  Future<Either<Failure, Unit>> showMilestoneNotification(int days) async {
    try {
      await localDataSource.showMilestoneNotification(days);
      return const Right(unit);
    } catch (e) {
      return Left(Failure.cacheError());
    }
  }
}