import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.serverError() = ServerError;
  const factory Failure.networkError() = NetworkError;
  const factory Failure.cacheError() = CacheError;
  const factory Failure.databaseError() = DatabaseError;
  const factory Failure.fileError() = FileError;
  const factory Failure.unexpectedError() = UnexpectedError;
}
