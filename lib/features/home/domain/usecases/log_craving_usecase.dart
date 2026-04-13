import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../repositories/home_repository.dart';

@injectable
class LogCravingUseCase {
  final HomeRepository repository;

  LogCravingUseCase(this.repository);

  Future<Either<Failure, Unit>> call() {
    return repository.logCraving();
  }
}
