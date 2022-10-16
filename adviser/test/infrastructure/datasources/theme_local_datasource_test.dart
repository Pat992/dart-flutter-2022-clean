import 'package:adviser/infrastructure/datasources/theme_local_datasource.dart';
import 'package:adviser/infrastructure/exceptions/exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'theme_local_datasource_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late ThemeLocalDatasource themeLocalDatasource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    themeLocalDatasource =
        ThemeLocalDatasourceImpl(sharedPreferences: mockSharedPreferences);
  });

  group('getThemeData', () {
    const testThemeData = true;

    test('Returns theme-data (bool) if there is one in shared preferences',
        () async {
      // arrange
      when(mockSharedPreferences.getBool(any)).thenReturn(testThemeData);

      // act
      final res = await themeLocalDatasource.getThemeData();

      // assert
      verify(mockSharedPreferences.getBool(cachedThemeMode));
      expect(res, testThemeData);
    });

    test(
        'Returns cache exception if there is no theme data in shared preferences',
        () async {
      // arrange
      when(mockSharedPreferences.getBool(any)).thenReturn(null);

      // act
      final call = themeLocalDatasource.getThemeData;

      // assert
      expect(() => call(), throwsA(const TypeMatcher<CacheException>()));
    });
  });

  group('setThemeData', () {
    const testThemeData = true;
    test('Calls shared preferences to save theme-mode', () {
      // arrange
      when(mockSharedPreferences.setBool(any, any))
          .thenAnswer((_) async => true);

      // act
      themeLocalDatasource.setThemeData(mode: testThemeData);

      // assert
      verify(mockSharedPreferences.setBool(cachedThemeMode, testThemeData));
    });
  });
}
