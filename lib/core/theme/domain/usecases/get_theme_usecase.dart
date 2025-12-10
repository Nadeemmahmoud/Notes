import '../repositories/theme_repository.dart';
import '../entities/app_theme_entity.dart';

class GetThemeUseCase {
  final ThemeRepository repository;

  GetThemeUseCase(this.repository);

  Future<AppThemeEntity> call() async {
    return repository.getTheme();
  }
}
