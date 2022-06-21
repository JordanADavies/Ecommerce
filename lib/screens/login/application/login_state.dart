part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoggingIn extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailed extends LoginState {
  final String errorMessage;

  LoginFailed(this.errorMessage);
}
