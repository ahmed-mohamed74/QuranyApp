part of 'theme_cubit.dart';

@immutable
sealed class ThemeState {}

final class ThemeInitial extends ThemeState {}

final class EmitThemeToggledState extends ThemeState {
  final String newTheme;

  EmitThemeToggledState({required this.newTheme});
}
