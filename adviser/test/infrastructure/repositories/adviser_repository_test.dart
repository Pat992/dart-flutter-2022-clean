import 'package:adviser/domain/failures/failures.dart';
import 'package:adviser/domain/repositories/adviser_repository.dart';
import 'package:adviser/infrastructure/datasources/adviser_remote_datasource.dart';
import 'package:adviser/infrastructure/exceptions/exceptions.dart';
import 'package:adviser/infrastructure/models/advise_model.dart';
import 'package:adviser/infrastructure/repositories/adviser_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'adviser_repository_test.mocks.dart';

@GenerateMocks([AdviserRemoteDatasource])
void main() {
  late AdviserRepository adviserRepository;
  late MockAdviserRemoteDatasource mockAdviserRemoteDatasource;

  setUp(() {
    mockAdviserRemoteDatasource = MockAdviserRemoteDatasource();
    adviserRepository =
        AdviserRepositoryImpl(remoteDataSource: mockAdviserRemoteDatasource);
  });

  group('getAdviseFromApi', () {
    final testAdviseModel = AdviseModel(advise: 'Test', id: 1);
    final testAdviseEntity = testAdviseModel;

    test(
        'Return remote data if the call to the remote datasource is successful',
        () async {
      // arrange
      when(mockAdviserRemoteDatasource.get())
          .thenAnswer((_) async => testAdviseModel);

      // act
      final res = await adviserRepository.getAdviseFromApi();

      // assert
      verify(mockAdviserRemoteDatasource.get());
      expect(res, Left(testAdviseEntity));
      verifyNoMoreInteractions(mockAdviserRemoteDatasource);
    });

    test('Return server exception if remote datasource throws exception',
        () async {
      // arrange
      when(mockAdviserRemoteDatasource.get()).thenThrow(ServerException());

      // act
      final res = await adviserRepository.getAdviseFromApi();

      // assert
      verify(mockAdviserRemoteDatasource.get());
      expect(res, Right(ServerFailure()));
      verifyNoMoreInteractions(mockAdviserRemoteDatasource);
    });

    test('Return general exception if anything else goes wrong', () async {
      // arrange
      when(mockAdviserRemoteDatasource.get()).thenThrow(Exception());

      // act
      final res = await adviserRepository.getAdviseFromApi();

      // assert
      verify(mockAdviserRemoteDatasource.get());
      expect(res, Right(GeneralFailure()));
      verifyNoMoreInteractions(mockAdviserRemoteDatasource);
    });
  });
}
