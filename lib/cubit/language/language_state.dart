part of 'language_cubit.dart';

@immutable
abstract class LanguageState {}

class LanguageInitial extends LanguageState{}

class ChangeLanguageSuccess extends LanguageState{
  final locale;
  ChangeLanguageSuccess(this.locale);
}