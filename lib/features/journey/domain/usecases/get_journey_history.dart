import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../entities/journey_day.dart';
import '../repositories/journey_repository.dart';

@lazySingleton
class GetJourneyHistory {
  final JourneyRepository repository;

  GetJourneyHistory(this.repository);
  Future<Either<Failure, List<JourneyDay>>> call({int? limit, int? offset}) async {
    return await repository.getJourneyHistory(limit: limit, offset: offset);
  }
}
