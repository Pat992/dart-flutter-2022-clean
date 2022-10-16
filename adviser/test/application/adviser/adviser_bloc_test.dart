import 'package:adviser/application/adviser/adviser_bloc.dart';
import 'package:adviser/domain/entities/advise_entity.dart';
import 'package:adviser/domain/failures/failures.dart';
import 'package:adviser/domain/usecases/adviser_usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'adviser_bloc_test.mocks.dart';

@GenerateMocks([AdviserUseCases])
void main() {
  late AdviserBloc adviserBloc;
  late MockAdviserUseCases mockAdviserUseCases;

  setUp(() {
    mockAdviserUseCases = MockAdviserUseCases();
    adviserBloc = AdviserBloc(useCases: mockAdviserUseCases);
  });

  test('Init state is AdviserInitial', () {
    // assert
    expect(adviserBloc.state, equals(AdviserInitial()));
  });

  group('AdviserRequestedEvent', () {
    final testAdvise = AdviseEntity(advise: 'Test', id: 1);
    const testAdviseString = 'Test';
    const serverFailure = 'No connection to the Server. Please try again.';
    const generalFailure = 'Ups, something has gone wrong. Please try again.';

    test('Calls use-case if event is added', () async {
      // arrange
      when(mockAdviserUseCases.getAdvise())
          .thenAnswer((_) async => Left(testAdvise));

      // act
      adviserBloc.add(AdviserRequestedEvent());
      await untilCalled(mockAdviserUseCases.getAdvise());

      // assert
      verify(mockAdviserUseCases.getAdvise());
      verifyNoMoreInteractions(mockAdviserUseCases);
    });

    test('Emits loading and then loaded states after event is emitted',
        () async {
      // arrange
      when(mockAdviserUseCases.getAdvise())
          .thenAnswer((_) async => Left(testAdvise));

      // assert later
      final List expectedStates = [
        AdviserStateLoading(),
        AdviserStateLoaded(advise: testAdviseString)
      ];

      expectLater(adviserBloc.stream, emitsInOrder(expectedStates));

      // act
      adviserBloc.add(AdviserRequestedEvent());
    });

    test(
        'Emits loading and then error states after event is emitted with server error',
        () async {
      // arrange
      when(mockAdviserUseCases.getAdvise())
          .thenAnswer((_) async => Right(ServerFailure()));

      // assert later
      final List expectedStates = [
        AdviserStateLoading(),
        AdviserStateError(errorMessage: serverFailure)
      ];

      expectLater(adviserBloc.stream, emitsInOrder(expectedStates));

      // act
      adviserBloc.add(AdviserRequestedEvent());
    });

    test(
        'Emits loading and then error states after event is emitted with general error',
        () async {
      // arrange
      when(mockAdviserUseCases.getAdvise())
          .thenAnswer((_) async => Right(GeneralFailure()));

      // assert later
      final List expectedStates = [
        AdviserStateLoading(),
        AdviserStateError(errorMessage: generalFailure)
      ];

      expectLater(adviserBloc.stream, emitsInOrder(expectedStates));

      // act
      adviserBloc.add(AdviserRequestedEvent());
    });
  });
}
