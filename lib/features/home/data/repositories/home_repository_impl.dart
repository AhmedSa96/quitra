import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/user_stats.dart';
import '../../domain/repositories/home_repository.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final SupabaseClient supabase;

  HomeRepositoryImpl(this.supabase);

  @override
  Future<Either<Failure, UserStats>> getHomeStats() async {
    try {
      final user = supabase.auth.currentUser;
      if (user == null) {
        return const Left(Failure.serverError());
      }

      final response = await supabase
          .from('profiles')
          .select('quit_start_date, cigarettes_per_day')
          .eq('id', user.id)
          .maybeSingle();

      if (response == null) {
        return const Left(Failure.serverError());
      }

      final quitStartDateStr = response['quit_start_date'] as String?;
      final cigarettesPerDay = response['cigarettes_per_day'] as int? ?? 0;

      if (quitStartDateStr == null) {
        return const Left(Failure.serverError()); // Or logic error
      }

      final quitStartDate = DateTime.parse(quitStartDateStr);
      final now = DateTime.now();

      final difference = now.difference(quitStartDate);
      final daysSmokeFree = difference.inDays > 0 ? difference.inDays : 0;

      final cigarettesAvoided = daysSmokeFree * cigarettesPerDay;
      const pricePerCigarette = 0.50; // Assume $0.50 per cigarette for MVP
      final moneySaved = cigarettesAvoided * pricePerCigarette;

      final stats = UserStats(
        daysSmokeFree: daysSmokeFree,
        cigarettesAvoided: cigarettesAvoided,
        moneySaved: moneySaved,
      );

      return Right(stats);
    } catch (e) {
      return const Left(Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, Unit>> logCraving() async {
    try {
      final user = supabase.auth.currentUser;
      if (user == null) {
        return const Left(Failure.serverError());
      }

      await supabase.from('craving_events').insert({'user_id': user.id});

      return const Right(unit);
    } catch (e) {
      return const Left(Failure.serverError());
    }
  }
}
