part of 'theme_cubit.dart';

@immutable
abstract class ThemeState {}

class ThemeInitial extends ThemeState {}

class ChangeThemeSuccess extends ThemeState{
  final bool isDarkMode;
  ChangeThemeSuccess(this.isDarkMode);
}