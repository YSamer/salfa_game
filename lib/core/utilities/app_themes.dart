import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:salfa_game/core/utilities/app_color.dart';
import 'package:salfa_game/injections.dart';

class AppThemes {
  AppThemes._();

  static ThemeData get lightTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        fontFamily: 'Poppins',
      );

  static ThemeData get darkTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        scaffoldBackgroundColor: AppColors.backGroundColor,
        useMaterial3: true,
        fontFamily: 'Poppins',
      );
}

String themeModeKey = 'THEME_MODE';

Future<ThemeMode> setLocale(String themeMode) async {
  await getIt<SharedPreferences>().setString(themeModeKey, themeMode);
  return _themeMode(themeMode);
}

ThemeMode get getThemeMode {
  String themeMode =
      getIt<SharedPreferences>().getString(themeModeKey) ?? 'Light';
  return _themeMode(themeMode);
}

ThemeMode _themeMode(String themeMode) {
  switch (themeMode) {
    case 'Dark':
      return ThemeMode.dark;
    case 'Light':
      return ThemeMode.light;
    default:
      return ThemeMode.light;
  }
}
