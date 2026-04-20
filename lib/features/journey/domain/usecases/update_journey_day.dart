import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../repositories/journey_repository.dart';

@lazySingleton
class UpdateJourneyDay {
  final JourneyRepository repository;

  UpdateJourneyDay(this.repository);

  Future<Either<Failure, Unit>> call(UpdateJourneyDayParams params) async {
    return await repository.updateJourneyDay(
      date: params.date,
      wasSmoked: params.wasSmoked,
      cravingLevel: params.cravingLevel,
      note: params.note,
    );
  }
}

class UpdateJourneyDayParams {
  final DateTime date;
  final bool? wasSmoked;
  final int? cravingLevel;
  final String? note;

  const UpdateJourneyDayParams({
    required this.date,
    this.wasSmoked,
    this.cravingLevel,
    this.note,
  });
}
