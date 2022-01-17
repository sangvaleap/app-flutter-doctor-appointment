part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class InitialLoginState extends LoginState {}

class LoginError extends LoginState {
  final String errorMessage;

  LoginError({
    required this.errorMessage,
  });
}

class LoginWaiting extends LoginState {}

class LoginSuccess extends LoginState {
  final List<LoginModel> loginData;
  LoginSuccess({required this.loginData});
}