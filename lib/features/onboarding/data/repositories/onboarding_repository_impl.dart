import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../streak/domain/entities/streak.dart';
import '../../domain/repositories/onboarding_repository.dart';
import '../datasources/onboarding_local_data_source.dart';
import '../models/user_profile_isar.dart';

@LazySingleton(as: OnboardingRepository)
class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingLocalDataSource localDataSource;

  OnboardingRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, Unit>> completeOnboarding({
    required int cigarettesPerDay,
    required int yearsSmoking,
    required String quitMethod,
    required DateTime quitStartDate,
    double? cigarettePrice,
    double? packetPrice,
    int? cigarettesPerPacket,
    StreakMode streakMode = StreakMode.forgiving,
  }) async {
    try {
      final profile = UserProfileIsar()
        ..cigarettesPerDay = cigarettesPerDay
        ..yearsSmoking = yearsSmoking
        ..quitMethod = quitMethod
        ..quitStartDate = quitStartDate
        ..cigarettePrice = cigarettePrice
        ..packetPrice = packetPrice
        ..cigarettesPerPacket = cigarettesPerPacket;
        
      await localDataSource.saveUserProfile(profile);
      await localDataSource.saveStreakMode(streakMode.index);

      return const Right(unit);
    } catch (e) {
      return const Left(Failure.databaseError());
    }
  }

  @override
  Future<Either<Failure, bool>> isOnboardingCompleted() async {
    try {
      final hasProfile = await localDataSource.hasUserProfile();
      return Right(hasProfile);
    } catch (e) {
      return const Left(Failure.databaseError());
    }
  }
}

