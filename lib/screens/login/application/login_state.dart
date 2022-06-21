part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginStateInitial extends LoginState {}

class LoginStateLoggingIn extends LoginState {}

class LoginStateSuccess extends LoginState {}

class LoginStateFailed extends LoginState {
  final String errorMessage;

  LoginStateFailed(this.errorMessage);
}
