import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/app_theme_entity.dart';
import '../../../domain/usecases/get_theme_usecase.dart';
import '../../../domain/usecases/set_thme_usecase.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final GetThemeUseCase _getThemeUseCase;
  final SetThemeUseCase _setThemeUseCase;

  ThemeCubit(this._getThemeUseCase, this._setThemeUseCase)
    : super(ThemeInitial());

  Future<void> loadTheme() async {
    try {
      final themeEntity = await _getThemeUseCase();
      emit(ThemeLoaded(themeEntity.themeMode));
    } catch (e) {
      // Fallback to system theme if loading fails
      emit(const ThemeLoaded(AppThemeMode.system));
    }
  }

  Future<void> changeTheme(AppThemeMode themeMode) async {
    final currentState = state;
    if (currentState is ThemeLoaded &&
        currentState.themeMode == themeMode) {
      return; // No change needed
    }

    try {
      // Optimistically update UI first
      emit(ThemeLoaded(themeMode));

      // Then persist
      await _setThemeUseCase(themeMode);
    } catch (e) {
      // Revert on error
      if (currentState is ThemeLoaded) {
        emit(ThemeLoaded(currentState.themeMode));
      }
    }
  }
}
