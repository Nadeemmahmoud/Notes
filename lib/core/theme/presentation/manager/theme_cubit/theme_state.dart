import 'package:equatable/equatable.dart';
import 'package:notes_app/core/theme/domain/entities/app_theme_entity.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();
}

class ThemeInitial extends ThemeState {
  @override
  List<Object?> get props => [];
}

class ThemeLoaded extends ThemeState {
  final AppThemeMode themeMode;

  const ThemeLoaded(this.themeMode);

  @override
  List<Object?> get props => [themeMode];
}
