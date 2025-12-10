enum AppThemeMode { light, dark, system }

class AppThemeEntity {
  final AppThemeMode themeMode;

  const AppThemeEntity({required this.themeMode});
}
