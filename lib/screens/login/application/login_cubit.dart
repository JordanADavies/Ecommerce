import 'package:bloc/bloc.dart';
import 'package:ecommerce/screens/login/infrastructure/login_facade.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginFacade _loginFacade;

  LoginCubit({LoginFacade? loginFacade})
      : _loginFacade = loginFacade ?? LoginFacade(),
        super(LoginStateInitial());

  Future<void> login({
    required String username,
    required String password,
  }) async {
    emit(LoginStateLoggingIn());
    final result = await _loginFacade.login(
      username: username,
      password: password,
    );
    result.fold(
      (errorMessage) => emit(LoginStateFailed(errorMessage)),
      (_) => emit(LoginStateSuccess()),
    );
  }
}
