import '../entities/app_theme_entity.dart';
import '../repositories/theme_repository.dart';

class SetThemeUseCase {
  final ThemeRepository repository;

  SetThemeUseCase(this.repository);

  Future<void> call(AppThemeMode themeMode) async {
    return repository.setTheme(themeMode);
  }
}