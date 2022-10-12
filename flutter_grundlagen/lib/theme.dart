import 'package:flutter/material.dart';

class AppTheme {
  AppTheme();

  static final Color _lightPrimaryColor = Colors.blueGrey.shade50;
  static final Color _lightPrimaryVariantColor = Colors.blueGrey.shade800;
  static final Color _lightOnPrimaryColor = Colors.blueGrey.shade200;
  static const Color _lightTextColorPrimary = Colors.black;
  static const Color _appbarColorLight = Colors.blue;

  static final Color _darkPrimaryColor = Colors.blueGrey.shade900;
  static const Color _darkPrimaryVariantColor = Colors.black;
  static final Color _darkOnPrimaryColor = Colors.blueGrey.shade300;
  static const Color _darkTextColorPrimary = Colors.white;
  static final Color _appbarColorDark = Colors.blueGrey.shade800;

  static const Color _iconColor = Colors.white;
  static final Color _iconColorUnselected = Colors.grey.shade500;

  static const TextStyle _lightHeadingText = TextStyle(
    color: _lightTextColorPrimary,
    //fontFamily: "Rubik",
  );

  static const TextStyle _lightBodyText = TextStyle(
    color: _lightTextColorPrimary,
    //fontFamily: "Rubik",
    fontStyle: FontStyle.italic,
  );

  static const TextTheme _lightTextTheme = TextTheme(
    headline1: _lightHeadingText,
    bodyText1: _lightBodyText,
  );

  static final TextStyle _darkThemeHeadingTextStyle =
      _lightHeadingText.copyWith(color: _darkTextColorPrimary);

  static final TextStyle _darkThemeBodyTextStyle =
      _lightBodyText.copyWith(color: _darkTextColorPrimary);

  static final TextTheme _darkTextTheme = TextTheme(
    headline1: _darkThemeHeadingTextStyle,
    bodyText1: _darkThemeBodyTextStyle,
  );

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: _lightPrimaryColor,
    appBarTheme: const AppBarTheme(
      foregroundColor: _iconColor,
      color: _appbarColorLight,
      iconTheme: IconThemeData(
        color: _iconColor,
      ),
    ),
    bottomAppBarColor: _appbarColorLight,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: _appbarColorLight,
      selectedItemColor: _iconColor,
      unselectedItemColor: _iconColorUnselected,
    ),
    colorScheme: ColorScheme.light(
      primary: _lightPrimaryColor,
      onPrimary: _lightOnPrimaryColor,
      primaryContainer: _lightPrimaryVariantColor,
    ),
    textTheme: _lightTextTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: _darkPrimaryColor,
    appBarTheme: AppBarTheme(
      foregroundColor: _iconColor,
      color: _appbarColorDark,
      iconTheme: const IconThemeData(
        color: _iconColor,
      ),
    ),
    bottomAppBarColor: _appbarColorDark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: _appbarColorDark,
      selectedItemColor: _iconColor,
      unselectedItemColor: _iconColorUnselected,
    ),
    colorScheme: ColorScheme.dark(
      primary: _darkPrimaryColor,
      onPrimary: _darkOnPrimaryColor,
      primaryContainer: _darkPrimaryVariantColor,
    ),
    textTheme: _darkTextTheme,
  );
}
