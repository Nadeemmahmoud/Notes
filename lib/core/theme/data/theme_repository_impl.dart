import 'package:notes_app/core/utils/cache_heper.dart';

import '../domain/entities/app_theme_entity.dart';
import '../domain/repositories/theme_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  static const _key = 'theme_mode';
  final CacheHelper cacheHelper;

  ThemeRepositoryImpl(this.cacheHelper);

  @override
  Future<AppThemeEntity> getTheme() async {
    try {
      final themeModeString = cacheHelper.getData(key: _key);
      final themeMode = _stringToThemeMode(themeModeString);
      return AppThemeEntity(themeMode: themeMode);
    } catch (e) {
      // Return system theme as fallback
      return const AppThemeEntity(themeMode: AppThemeMode.system);
    }
  }

  @override
  Future<void> setTheme(AppThemeMode themeMode) async {
    try {
      await cacheHelper.saveData(
        key: _key,
        value: _themeModeToString(themeMode),
      );
    } catch (e) {
      // Optionally log error or rethrow
      rethrow;
    }
  }

  AppThemeMode _stringToThemeMode(String? value) {
    switch (value) {
      case 'light':
        return AppThemeMode.light;
      case 'dark':
        return AppThemeMode.dark;
      default:
        return AppThemeMode.system;
    }
  }

  String _themeModeToString(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.light:
        return 'light';
      case AppThemeMode.dark:
        return 'dark';
      case AppThemeMode.system:
        return 'system';
    }
  }
}
