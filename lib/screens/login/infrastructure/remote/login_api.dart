import 'package:ecommerce/shared/http_client/http_client.dart';

class LoginApi {
  final HttpClient _client;

  LoginApi({HttpClient? client}) : _client = client ?? HttpClient();

  Future<String> login({
    required String username,
    required String password,
  }) async {
    final response = await _client.post(
      path: 'https://fakestoreapi.com/auth/login',
      body: {
        'username': username,
        'password': password,
      },
    );

    return 'token';
  }
}
