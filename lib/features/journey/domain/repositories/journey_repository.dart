import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/journey_day.dart';

abstract class JourneyRepository {
  Future<Either<Failure, List<JourneyDay>>> getJourneyHistory();
}
