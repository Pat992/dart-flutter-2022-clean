import 'package:adviser/domain/entities/advise_entity.dart';
import 'package:adviser/domain/failures/failures.dart';
import 'package:adviser/domain/repositories/adviser_repository.dart';
import 'package:adviser/domain/usecases/adviser_usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'adviser_usecases_test.mocks.dart';

// Use mockito to create "fake" classes
// use -> flutter packages run build_runner build --delete-conflicting-outputs
@GenerateMocks([AdviserRepository])
void main() {
  late AdviserUseCases adviserUseCases;
  late MockAdviserRepository mockAdviserRepository;

  setUp(() {
    mockAdviserRepository = MockAdviserRepository();
    adviserUseCases = AdviserUseCases(adviserRepository: mockAdviserRepository);
  });

  group('getAdvise use-case', () {
    final testAdvise = AdviseEntity(advise: 'Test', id: 1);

    test('return the created test-advise from repo', () async {
      // arrange
      when(mockAdviserRepository.getAdviseFromApi())
          .thenAnswer((_) async => Left(testAdvise));

      // act
      final res = await adviserUseCases.getAdvise();

      // assert
      // Check result
      expect(res, Left(testAdvise));
      // Check if function in repo has been called
      verify(mockAdviserRepository.getAdviseFromApi());
      // Check if nothing else has been called in repo
      verifyNoMoreInteractions(mockAdviserRepository);
    });

    test('return the created server failure from in repo', () async {
      // arrange
      when(mockAdviserRepository.getAdviseFromApi())
          .thenAnswer((_) async => Right(ServerFailure()));

      // act
      final res = await adviserUseCases.getAdvise();

      // assert
      // Check result -> use equatable to check if the same type
      expect(res, Right(ServerFailure()));
      // Check if function in repo has been called
      verify(mockAdviserRepository.getAdviseFromApi());
      // Check if nothing else has been called in repo
      verifyNoMoreInteractions(mockAdviserRepository);
    });

    test('return the created general failure from in repo', () async {
      // arrange
      when(mockAdviserRepository.getAdviseFromApi())
          .thenAnswer((_) async => Right(GeneralFailure()));

      // act
      final res = await adviserUseCases.getAdvise();

      // assert
      // Check result -> use equatable to check if the same type
      expect(res, Right(GeneralFailure()));
      // Check if function in repo has been called
      verify(mockAdviserRepository.getAdviseFromApi());
      // Check if nothing else has been called in repo
      verifyNoMoreInteractions(mockAdviserRepository);
    });
  });
}
