import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../repositories/home_repository.dart';

@lazySingleton
class SaveDailyLog {
  final HomeRepository repository;

  SaveDailyLog(this.repository);

  Future<Either<Failure, Unit>> call(SaveDailyLogParams params) async {
    return await repository.saveDailyCheckIn(
      wasSmoked: params.wasSmoked,
      cravingLevel: params.cravingLevel,
      note: params.note,
    );
  }
}

class SaveDailyLogParams {
  final bool wasSmoked;
  final int cravingLevel;
  final String? note;

  SaveDailyLogParams({
    required this.wasSmoked,
    required this.cravingLevel,
    this.note,
  });
}
