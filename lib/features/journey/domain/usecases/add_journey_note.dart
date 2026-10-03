import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../repositories/journey_repository.dart';

@lazySingleton
class AddJourneyNote {
  final JourneyRepository repository;

  AddJourneyNote(this.repository);

  Future<Either<Failure, Unit>> call(AddJourneyNoteParams params) async {
    return await repository.addJourneyNote(
      date: params.date,
      text: params.text,
    );
  }
}

class AddJourneyNoteParams {
  final DateTime date;
  final String text;

  const AddJourneyNoteParams({
    required this.date,
    required this.text,
  });
}
