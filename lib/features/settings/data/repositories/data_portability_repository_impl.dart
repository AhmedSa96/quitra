import 'dart:io';
import 'package:csv/csv.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/error/failures.dart';
import '../../../home/data/models/craving_event_isar.dart';
import '../../../home/data/models/daily_log_isar.dart';
import '../../../home/data/models/user_stats_isar.dart';
import '../../../onboarding/data/models/user_profile_isar.dart';
import '../../domain/repositories/data_portability_repository.dart';
import '../models/user_settings_isar.dart';

@LazySingleton(as: DataPortabilityRepository)
class DataPortabilityRepositoryImpl implements DataPortabilityRepository {
  final Isar isar;

  DataPortabilityRepositoryImpl(this.isar);

  @override
  Future<Either<Failure, Unit>> exportDataToCsv() async {
    try {
      final List<List<dynamic>> csvData = [];

      // 1. User Profile
      final profile = await isar.userProfileIsars.where().findFirst();
      if (profile != null) {
        csvData.add(['--- USER PROFILE ---']);
        csvData.add([
          'ID',
          'Cigarettes Per Day',
          'Years Smoking',
          'Quit Method',
          'Quit Start Date',
          'Cigarette Price',
          'Packet Price',
          'Cigarettes Per Packet'
        ]);
        csvData.add([
          profile.id,
          profile.cigarettesPerDay,
          profile.yearsSmoking,
          profile.quitMethod,
          profile.quitStartDate.toIso8601String(),
          profile.cigarettePrice ?? '',
          profile.packetPrice ?? '',
          profile.cigarettesPerPacket ?? ''
        ]);
        csvData.add([]);
      }

      // 2. Daily Logs
      final dailyLogs = await isar.dailyLogIsars.where().sortByDate().findAll();
      if (dailyLogs.isNotEmpty) {
        csvData.add(['--- DAILY LOGS ---']);
        csvData.add(['Date', 'Was Smoked', 'Craving Level', 'Note']);
        for (final log in dailyLogs) {
          csvData.add([
            log.date.toIso8601String(),
            log.wasSmoked,
            log.cravingLevel,
            log.note ?? ''
          ]);
        }
        csvData.add([]);
      }

      // 3. Craving Events
      final cravings = await isar.cravingEventIsars.where().sortByTimestamp().findAll();
      if (cravings.isNotEmpty) {
        csvData.add(['--- CRAVING EVENTS ---']);
        csvData.add(['Timestamp', 'Was Smoked']);
        for (final craving in cravings) {
          csvData.add([
            craving.timestamp.toIso8601String(),
            craving.wasSmoked
          ]);
        }
        csvData.add([]);
      }

      // 4. User Stats (Singleton)
      final stats = await isar.userStatsIsars.get(0);
      if (stats != null) {
        csvData.add(['--- USER STATS ---']);
        csvData.add([
          'Days Smoke Free',
          'Cigarettes Avoided',
          'Money Saved',
          'Cravings Logged',
          'Last Updated'
        ]);
        csvData.add([
          stats.daysSmokeFree,
          stats.cigarettesAvoided,
          stats.moneySaved,
          stats.cravingsLogged,
          stats.lastUpdated?.toIso8601String() ?? ''
        ]);
        csvData.add([]);
      }

      // 5. User Settings (Singleton)
      final settings = await isar.userSettingsIsars.get(0);
      if (settings != null) {
        csvData.add(['--- USER SETTINGS ---']);
        csvData.add([
          'Locale',
          'Daily Reminder Enabled',
          'Daily Reminder Time',
          'Milestone Celebrations Enabled'
        ]);
        csvData.add([
          settings.locale ?? '',
          settings.dailyReminderEnabled,
          settings.dailyReminderTime ?? '',
          settings.milestoneCelebrationsEnabled
        ]);
      }

      // Generate CSV string
      final csvString = const ListToCsvConverter().convert(csvData);

      // Save to temporary file
      final directory = await getTemporaryDirectory();
      final file = File('${directory.path}/quitra_data_export_${DateTime.now().millisecondsSinceEpoch}.csv');
      await file.writeAsString(csvString);

      // Share file
      await Share.shareXFiles([XFile(file.path)], text: 'My Quitra Data Export');

      return const Right(unit);
    } catch (e) {
      return const Left(Failure.databaseError());
    }
  }

  @override
  Future<Either<Failure, Unit>> importDataFromCsv(String filePath) async {
    try {
      final file = File(filePath);
      final csvString = await file.readAsString();
      final List<List<dynamic>> rows = const CsvToListConverter().convert(csvString);

      if (rows.isEmpty) return const Left(Failure.fileError());

      await isar.writeTxn(() async {
        // Clear all relevant collections
        await isar.userProfileIsars.clear();
        await isar.dailyLogIsars.clear();
        await isar.cravingEventIsars.clear();
        await isar.userStatsIsars.clear();
        await isar.userSettingsIsars.clear();

        String currentSection = '';
        List<String> headers = [];

        for (final row in rows) {
          if (row.isEmpty) continue;

          final firstCell = row[0].toString();
          if (firstCell.startsWith('---')) {
            currentSection = firstCell;
            headers = [];
            continue;
          }

          if (headers.isEmpty) {
            headers = row.map((e) => e.toString()).toList();
            continue;
          }

          // Process row based on current section
          if (currentSection == '--- USER PROFILE ---') {
            final profile = UserProfileIsar()
              ..cigarettesPerDay = row[1] as int
              ..yearsSmoking = row[2] as int
              ..quitMethod = row[3].toString()
              ..quitStartDate = DateTime.parse(row[4].toString())
              ..cigarettePrice = double.tryParse(row[5].toString())
              ..packetPrice = double.tryParse(row[6].toString())
              ..cigarettesPerPacket = int.tryParse(row[7].toString());
            await isar.userProfileIsars.put(profile);
          } else if (currentSection == '--- DAILY LOGS ---') {
            final log = DailyLogIsar()
              ..date = DateTime.parse(row[0].toString())
              ..wasSmoked = row[1] as bool
              ..cravingLevel = row[2] as int
              ..note = row[3].toString().isNotEmpty ? row[3].toString() : null;
            await isar.dailyLogIsars.put(log);
          } else if (currentSection == '--- CRAVING EVENTS ---') {
            final craving = CravingEventIsar()
              ..timestamp = DateTime.parse(row[0].toString())
              ..wasSmoked = row[1] as bool;
            await isar.cravingEventIsars.put(craving);
          } else if (currentSection == '--- USER STATS ---') {
            final stats = UserStatsIsar()
              ..daysSmokeFree = row[0] as int
              ..cigarettesAvoided = row[1] as int
              ..moneySaved = double.parse(row[2].toString())
              ..cravingsLogged = row[3] as int
              ..lastUpdated = row[4].toString().isNotEmpty ? DateTime.parse(row[4].toString()) : null;
            await isar.userStatsIsars.put(stats);
          } else if (currentSection == '--- USER SETTINGS ---') {
            final settings = UserSettingsIsar()
              ..locale = row[0].toString().isNotEmpty ? row[0].toString() : null
              ..dailyReminderEnabled = row[1] as bool
              ..dailyReminderTime = row[2].toString().isNotEmpty ? row[2].toString() : null
              ..milestoneCelebrationsEnabled = row[3] as bool;
            await isar.userSettingsIsars.put(settings);
          }
        }
      });

      return const Right(unit);
    } catch (e) {
      return const Left(Failure.databaseError());
    }
  }
}
