import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/journey_day.dart';

abstract class JourneyRepository {
  Future<Either<Failure, List<JourneyDay>>> getJourneyHistory();
  Future<Either<Failure, Unit>> updateJourneyDay({
    required DateTime date,
    bool? wasSmoked,
    int? cravingLevel,
    String? note,
  });
}
