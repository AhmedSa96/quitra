import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../repositories/data_portability_repository.dart';

@lazySingleton
class ExportDataUseCase {
  final DataPortabilityRepository repository;

  ExportDataUseCase(this.repository);

  Future<Either<Failure, Unit>> call() {
    return repository.exportDataToCsv();
  }
}
