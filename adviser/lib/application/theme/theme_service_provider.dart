import 'package:adviser/domain/repositories/theme_repository.dart';
import 'package:flutter/foundation.dart';

abstract class ThemeService extends ChangeNotifier {
  late bool isDarkMode;

  Future<void> init();
  Future<void> toggleTheme();
  Future<void> setTheme({required bool mode});
}

class ThemeServiceImpl extends ChangeNotifier implements ThemeService {
  final ThemeRepository themeRepository;

  ThemeServiceImpl({required this.themeRepository});

  @override
  bool isDarkMode = true;

  @override
  Future<void> init() async {
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
}
