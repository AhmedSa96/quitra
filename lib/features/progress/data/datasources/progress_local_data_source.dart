import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import '../../../onboarding/data/models/user_profile_isar.dart';
import '../../../home/data/models/daily_log_isar.dart';
import '../../domain/entities/progress_stats.dart';

abstract class ProgressLocalDataSource {
  Future<ProgressStats> getProgressStats();
}

@LazySingleton(as: ProgressLocalDataSource)
class ProgressLocalDataSourceImpl implements ProgressLocalDataSource {
  final Isar isar;

  ProgressLocalDataSourceImpl(this.isar);

  @override
  Future<ProgressStats> getProgressStats() async {
    final userProfile = await isar.userProfileIsars.where().findFirst();
    if (userProfile == null) {
      return const ProgressStats(
        daysSmokeFree: 0,
        moneySaved: 0,
        cigarettesAvoided: 0,
        lifeRegainedMinutes: 0,
        currentStreak: 0,
        heartRateProgress: 0,
        circulationProgress: 0,
        lungFunctionProgress: 0,
      );
    }

    final dailyLogs = await isar.dailyLogIsars.where().findAll();
    final now = DateTime.now();
    final quitStartDate = userProfile.quitStartDate;

    final daysSmokeFree = _calculateDaysSmokeFree(quitStartDate, now);
    final cigarettesAvoided = _calculateCigarettesAvoided(
      daysSmokeFree,
      userProfile.cigarettesPerDay,
    );
    final smokedCount = await _countSmokedCigarettes(dailyLogs);
    final effectiveAvoided = cigarettesAvoided - smokedCount;
    final pricePerCigarette = _calculatePricePerCigarette(userProfile);
    final moneySaved = _calculateMoneySaved(effectiveAvoided, pricePerCigarette);
    final lifeRegainedMinutes = _calculateLifeRegained(effectiveAvoided);
    final currentStreak = _calculateCurrentStreak(dailyLogs, quitStartDate);

    final heartRateProgress = _calculateHeartRateProgress(daysSmokeFree);
    final circulationProgress = _calculateCirculationProgress(daysSmokeFree);
    final lungFunctionProgress = _calculateLungFunctionProgress(daysSmokeFree);

    return ProgressStats(
      daysSmokeFree: daysSmokeFree,
      moneySaved: moneySaved,
      cigarettesAvoided: effectiveAvoided > 0 ? effectiveAvoided : 0,
      lifeRegainedMinutes: lifeRegainedMinutes,
      currentStreak: currentStreak,
      heartRateProgress: heartRateProgress,
      circulationProgress: circulationProgress,
      lungFunctionProgress: lungFunctionProgress,
    );
  }

  int _calculateDaysSmokeFree(DateTime quitStartDate, DateTime now) {
    final difference = now.difference(quitStartDate);
    return difference.inDays > 0 ? difference.inDays : 0;
  }

  int _calculateCigarettesAvoided(int daysSmokeFree, int cigarettesPerDay) {
    return daysSmokeFree * cigarettesPerDay;
  }

  Future<int> _countSmokedCigarettes(List<DailyLogIsar> logs) async {
    int count = 0;
    for (final log in logs) {
      if (log.wasSmoked) {
        count++;
      }
    }
    return count;
  }

  double _calculatePricePerCigarette(UserProfileIsar profile) {
    if (profile.cigarettePrice != null) {
      return profile.cigarettePrice!;
    }
    if (profile.packetPrice != null &&
        profile.cigarettesPerPacket != null &&
        profile.cigarettesPerPacket! > 0) {
      return profile.packetPrice! / profile.cigarettesPerPacket!;
    }
    return 0.50;
  }

  double _calculateMoneySaved(int effectiveAvoided, double pricePerCigarette) {
    return effectiveAvoided * pricePerCigarette;
  }

  int _calculateLifeRegained(int cigarettesAvoided) {
    return cigarettesAvoided * 15;
  }

  int _calculateCurrentStreak(List<DailyLogIsar> logs, DateTime quitStartDate) {
    if (logs.isEmpty) {
      return _calculateDaysSmokeFree(quitStartDate, DateTime.now());
    }

    logs.sort((a, b) => b.date.compareTo(a.date));

    int streak = 0;
    for (final log in logs) {
      if (!log.wasSmoked) {
        streak++;
      } else {
        break;
      }
    }
    return streak;
  }

  double _calculateHeartRateProgress(int daysSmokeFree) {
    return (daysSmokeFree / 20).clamp(0.0, 1.0);
  }

  double _calculateCirculationProgress(int daysSmokeFree) {
    return (daysSmokeFree / 90).clamp(0.0, 1.0);
  }

  double _calculateLungFunctionProgress(int daysSmokeFree) {
    return (daysSmokeFree / 270).clamp(0.0, 1.0);
  }
}