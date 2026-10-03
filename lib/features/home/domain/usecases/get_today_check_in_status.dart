import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/today_check_in_status.dart';
import '../repositories/home_repository.dart';

@injectable
class GetTodayCheckInStatus {
  final HomeRepository repository;

  GetTodayCheckInStatus(this.repository);

  Future<Either<Failure, TodayCheckInStatus>> call() {
    return repository.getTodayCheckInStatus();
  }
}
