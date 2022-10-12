import 'package:flutter/foundation.dart';

class ThemeService extends ChangeNotifier {
  bool _isDarkMode = false;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  get isDarkMode => _isDarkMode;
}
