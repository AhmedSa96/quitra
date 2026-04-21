import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../repositories/data_portability_repository.dart';

@lazySingleton
class ImportDataUseCase {
  final DataPortabilityRepository repository;

  ImportDataUseCase(this.repository);

  Future<Either<Failure, Unit>> call(String filePath) {
    return repository.importDataFromCsv(filePath);
  }
}
