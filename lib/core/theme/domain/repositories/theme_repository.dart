
import '../entities/app_theme_entity.dart';

abstract class ThemeRepository {
  Future<AppThemeEntity> getTheme();
  Future<void> setTheme(AppThemeMode themeMode);
}