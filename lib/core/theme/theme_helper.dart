import 'package:flutter/material.dart';

import 'domain/entities/app_theme_entity.dart';

ThemeMode mapThemeMode(AppThemeMode mode) {
  return switch (mode) {
    AppThemeMode.light => ThemeMode.light,
    AppThemeMode.dark => ThemeMode.dark,
    AppThemeMode.system => ThemeMode.system,
  };
}

IconData getThemeIcon(AppThemeMode mode) {
  switch (mode) {
    case AppThemeMode.light:
      return Icons.light_mode;
    case AppThemeMode.dark:
      return Icons.dark_mode;
    case AppThemeMode.system:
      return Icons.brightness_auto;
  }
}
