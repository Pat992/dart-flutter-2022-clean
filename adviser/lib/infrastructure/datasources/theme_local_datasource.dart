import 'package:adviser/infrastructure/exceptions/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

const cachedThemeMode = 'CACHED_THEME_MODE';
const systemThemeMode = 'SYSTEM_THEME_MODE';

abstract class ThemeLocalDatasource {
  Future<bool> getThemeData();
  Future<void> setThemeData({required bool mode});
  Future<bool> getUseSystemTheme();
  Future<void> setUseSystemTheme({required bool useSystemTheme});
}

class ThemeLocalDatasourceImpl implements ThemeLocalDatasource {
  final SharedPreferences sharedPreferences;

  ThemeLocalDatasourceImpl({required this.sharedPreferences});

  @override
  Future<bool> getThemeData() async {
    try {
      final themeData = sharedPreferences.getBool(cachedThemeMode);
      // shared preference is a future, but cannot be called async, therefore return Future.value
      return Future.value(themeData);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> setThemeData({required bool mode}) {
    return sharedPreferences.setBool(cachedThemeMode, mode);
  }

  @override
  Future<bool> getUseSystemTheme() {
    try {
      final systemTheme = sharedPreferences.getBool(systemThemeMode);
      // shared preference is a future, but cannot be called async, therefore return Future.value
      return Future.value(systemTheme);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> setUseSystemTheme({required bool useSystemTheme}) {
    return sharedPreferences.setBool(systemThemeMode, useSystemTheme);
  }
}
