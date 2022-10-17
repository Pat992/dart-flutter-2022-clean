import 'package:adviser/domain/repositories/theme_repository.dart';
import 'package:flutter/foundation.dart';

abstract class ThemeService extends ChangeNotifier {
  late bool isDarkMode;
  late bool useSystemTheme;

  Future<void> init();
  Future<void> toggleTheme();
  Future<void> setTheme({required bool mode});
  Future<void> toggleUseSystemTheme();
  Future<void> setUseSystemTheme({required bool systemTheme});
}

class ThemeServiceImpl extends ChangeNotifier implements ThemeService {
  final ThemeRepository themeRepository;

  ThemeServiceImpl({required this.themeRepository});

  @override
  late bool isDarkMode = true;
  @override
  late bool useSystemTheme;

  @override
  Future<void> init() async {
    final useSystem = await themeRepository.getUseSystemTheme();
    await useSystem.fold(
      (systemTheme) async => await setUseSystemTheme(systemTheme: systemTheme),
      (failure) async => await setUseSystemTheme(systemTheme: false),
    );

    final modeOrFailure = await themeRepository.getTheme();
    await modeOrFailure.fold(
      (mode) async => await setTheme(mode: mode),
      (failure) async => await setTheme(mode: true),
    );
  }

  @override
  Future<void> setTheme({required bool mode}) async {
    isDarkMode = mode;
    await themeRepository.setTheme(themeMode: isDarkMode);
    notifyListeners();
  }

  @override
  Future<void> toggleTheme() async {
    await setTheme(mode: !isDarkMode);
  }

  @override
  Future<void> setUseSystemTheme({required bool systemTheme}) async {
    useSystemTheme = systemTheme;
    await themeRepository.setUseSystemTheme(useSystemTheme: useSystemTheme);
    notifyListeners();
  }

  @override
  Future<void> toggleUseSystemTheme() async {
    await setUseSystemTheme(systemTheme: !useSystemTheme);
  }
}
