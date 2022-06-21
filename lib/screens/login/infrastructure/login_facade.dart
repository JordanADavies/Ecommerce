import 'package:dartz/dartz.dart';
import 'package:ecommerce/screens/login/infrastructure/local/user_token_storage_provider.dart';
import 'package:ecommerce/screens/login/infrastructure/remote/login_api.dart';

class LoginFacade {
  final LoginApi _loginApi;
  final UserTokenStorageProvider _userTokenStorageProvider;

  LoginFacade({
    LoginApi? loginApi,
    UserTokenStorageProvider? userTokenStorageProvider,
  })  : _loginApi = loginApi ?? LoginApi(),
        _userTokenStorageProvider =
            userTokenStorageProvider ?? UserTokenStorageProvider();

  Future<Either<String, Unit>> login({
    required String username,
    required String password,
  }) async {
    try {
      final token = await _loginApi.login(
        username: username,
        password: password,
      );
      await _userTokenStorageProvider.saveUserToken(token);
      return right(unit);
    } catch (e) {
      return left('$e');
    }
  }
}
