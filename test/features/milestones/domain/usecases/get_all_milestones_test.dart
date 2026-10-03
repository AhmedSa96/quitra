import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quitra/features/milestones/domain/entities/milestone.dart';
import 'package:quitra/features/milestones/domain/repositories/milestone_repository.dart';
import 'package:quitra/features/milestones/domain/usecases/get_all_milestones.dart';

class MockMilestoneRepository extends Mock implements MilestoneRepository {}

void main() {
  late GetAllMilestones useCase;
  late MockMilestoneRepository mockRepository;

  setUp(() {
    mockRepository = MockMilestoneRepository();
    useCase = GetAllMilestones(mockRepository);
  });

  test('calls repository.getAllMilestones and returns list of milestones', () async {
    final milestones = <Milestone>[];
    when(() => mockRepository.getAllMilestones())
        .thenAnswer((_) async => Right(milestones));

    final result = await useCase();

    expect(result, Right(milestones));
    verify(() => mockRepository.getAllMilestones()).called(1);
  });
}
