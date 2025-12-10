import 'package:flutter/material.dart';
import 'color_schemes.dart';

class AppThemeFactory {
  static ThemeData? _lightTheme;
  static ThemeData? _darkTheme;

  static ThemeData createTheme(bool isDark) {
    if (isDark) {
      return _darkTheme ??= _buildDarkTheme();
    } else {
      return _lightTheme ??= _buildLightTheme();
    }
  }

  static ThemeData _buildLightTheme() {
    return ThemeData(useMaterial3: true, colorScheme: AppColorSchemes.light);
  }

  static ThemeData _buildDarkTheme() {
    return ThemeData(useMaterial3: true, colorScheme: AppColorSchemes.dark);
  }

  // Clear cache during hot reload in debug mode
  static void clearCache() {
    assert(() {
      _lightTheme = null;
      _darkTheme = null;
      return true;
    }());
  }
}
