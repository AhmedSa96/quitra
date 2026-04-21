import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

abstract class DataPortabilityRepository {
  Future<Either<Failure, Unit>> exportDataToCsv();
  Future<Either<Failure, Unit>> importDataFromCsv(String filePath);
}
