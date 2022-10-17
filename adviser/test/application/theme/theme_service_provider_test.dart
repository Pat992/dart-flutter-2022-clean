import 'package:adviser/application/theme/theme_service_provider.dart';
import 'package:adviser/domain/failures/failures.dart';
import 'package:adviser/domain/repositories/theme_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'theme_service_provider_test.mocks.dart';

@GenerateMocks([ThemeRepository])
void main() {
  late ThemeService themeService;
  late MockThemeRepository mockThemeRepository;
  late int listenerCount;

  setUp(() {
    mockThemeRepository = MockThemeRepository();
    listenerCount = 0;
    // with addListener can be tested if notifyListener is called.
    themeService = ThemeServiceImpl(themeRepository: mockThemeRepository)
      ..addListener(() {
        listenerCount += 1;
      });
  });

  test('Default value for dark-mode is true', () {
    // assert
    expect(themeService.isDarkMode, true);
  });

  group('init', () {
    const testThemeMode = false;

    test('Gets theme mode from local datasource and notify listeners',
        () async {
      // arrange
      themeService.isDarkMode = true;
      when(mockThemeRepository.getTheme())
          .thenAnswer((_) async => const Left(testThemeMode));

      // act
      await themeService.init();

      // assert
      expect(themeService.isDarkMode, testThemeMode);
      expect(listenerCount, 1);
      verify(mockThemeRepository.getTheme());
    });

    test('If no themes are saved, use dark mode and notify listeners',
        () async {
      // arrange
      themeService.isDarkMode = true;
      when(mockThemeRepository.getTheme())
          .thenAnswer((_) async => Right(CacheFailure()));

      // act
      await themeService.init();

      // assert
      expect(themeService.isDarkMode, true);
      expect(listenerCount, 1);
      verify(mockThemeRepository.getTheme());
    });
  });

  group('setTheme', () {
    const testThemeMode = false;
    test('Sets the theme to the given parameter, and stores the information',
        () async {
      // arrange
      themeService.isDarkMode = true;
      when(mockThemeRepository.setTheme(themeMode: anyNamed('themeMode')))
          .thenAnswer((_) async => true);

      // act
      await themeService.setTheme(mode: testThemeMode);

      // assert
      expect(themeService.isDarkMode, testThemeMode);
      expect(listenerCount, 1);
      verify(mockThemeRepository.setTheme(themeMode: testThemeMode));
      verifyNoMoreInteractions(mockThemeRepository);
    });
  });

  group('toggleTheme', () {
    const testThemeMode = false;
    test('Toggles the theme mode, and stores the information', () async {
      // arrange
      themeService.isDarkMode = true;
      when(mockThemeRepository.setTheme(themeMode: anyNamed('themeMode')))
          .thenAnswer((_) async => true);

      // act
      await themeService.toggleTheme();

      // assert
      expect(themeService.isDarkMode, testThemeMode);
      expect(listenerCount, 1);
      verify(mockThemeRepository.setTheme(themeMode: testThemeMode));
      verifyNoMoreInteractions(mockThemeRepository);
    });
  });
}
