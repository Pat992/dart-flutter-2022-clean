import 'package:adviser/domain/failures/failures.dart';
import 'package:adviser/domain/repositories/theme_repository.dart';
import 'package:adviser/infrastructure/datasources/theme_local_datasource.dart';
import 'package:adviser/infrastructure/exceptions/exceptions.dart';
import 'package:adviser/infrastructure/repositories/theme_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'theme_repository_test.mocks.dart';

@GenerateMocks([ThemeLocalDatasource])
void main() {
  late ThemeRepository themeRepository;
  late MockThemeLocalDatasource mockThemeLocalDatasource;

  setUp(() {
    mockThemeLocalDatasource = MockThemeLocalDatasource();
    themeRepository =
        ThemeRepositoryImpl(themeLocalDatasource: mockThemeLocalDatasource);
  });

  group('setTheme', () {
    const testThemeMode = true;
    test('Call function to set theme mode in local datasource', () {
      // arrange
      when(mockThemeLocalDatasource.setThemeData(mode: anyNamed('mode')))
          .thenAnswer((_) async => true);

      // act
      themeRepository.setTheme(themeMode: testThemeMode);

      // assert
      verify(mockThemeLocalDatasource.setThemeData(mode: testThemeMode));
      verifyNoMoreInteractions(mockThemeLocalDatasource);
    });
  });

  group('getTheme', () {
    const testThemeMode = true;
    test('Call function to get theme mode in local datasource', () async {
      // arrange
      when(mockThemeLocalDatasource.getThemeData())
          .thenAnswer((_) async => testThemeMode);

      // act
      final res = await themeRepository.getTheme();

      // assert
      expect(res, const Left(testThemeMode));
      verify(mockThemeLocalDatasource.getThemeData());
      verifyNoMoreInteractions(mockThemeLocalDatasource);
    });

    test(
        'Call function to get theme mode in local datasource, return Failure since none is existing',
        () async {
      // arrange
      when(mockThemeLocalDatasource.getThemeData()).thenThrow(CacheException());

      // act
      final res = await themeRepository.getTheme();

      // assert
      expect(res, Right(CacheFailure()));
      verify(mockThemeLocalDatasource.getThemeData());
      verifyNoMoreInteractions(mockThemeLocalDatasource);
    });
  });
}
