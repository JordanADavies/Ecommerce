import 'package:ecommerce/screens/login/infrastructure/remote/login_api.dart';
import 'package:ecommerce/shared/http_client/http_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_api_test.mocks.dart';

@GenerateMocks([HttpClient])
void main() {
  group('Login Api - Login', () {
    test('returns token when http client returns valid response', () async {
      final mockHttpClient = MockHttpClient();
      final loginApi = LoginApi(client: mockHttpClient);

      when(mockHttpClient.post(
        path: anyNamed('path'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => {'token': 'token'});

      final result = await loginApi.login(
        username: 'username',
        password: 'password',
      );

      expect(result, 'token');
    });

    test('returns null when http client returns invalid response', () async {
      final mockHttpClient = MockHttpClient();
      final loginApi = LoginApi(client: mockHttpClient);

      when(mockHttpClient.post(
        path: anyNamed('path'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => {'auth_token': 'token'});

      final result = await loginApi.login(
        username: 'username',
        password: 'password',
      );

      expect(result, null);
    });

    test('returns null when http client returns null', () async {
      final mockHttpClient = MockHttpClient();
      final loginApi = LoginApi(client: mockHttpClient);

      when(mockHttpClient.post(
        path: anyNamed('path'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => null);

      final result = await loginApi.login(
        username: 'username',
        password: 'password',
      );

      expect(result, null);
    });
  });
}
