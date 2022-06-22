import 'package:dartz/dartz.dart';
import 'package:ecommerce/screens/login/infrastructure/local/user_token_storage_provider.dart';
import 'package:ecommerce/screens/login/infrastructure/login_facade.dart';
import 'package:ecommerce/screens/login/infrastructure/remote/login_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_facade_test.mocks.dart';

@GenerateMocks([
  LoginApi,
  UserTokenStorageProvider,
])
void main() {
  group('Login Facade - Login', () {
    test('returns success when login api returns a token', () async {
      final mockLoginApi = MockLoginApi();
      final mockUserTokenStorageProvider = MockUserTokenStorageProvider();
      final loginFacade = LoginFacade(
        loginApi: mockLoginApi,
        userTokenStorageProvider: mockUserTokenStorageProvider,
      );

      when(mockLoginApi.login(
        username: anyNamed('username'),
        password: anyNamed('password'),
      )).thenAnswer((_) async => 'token');

      final result = await loginFacade.login(
        username: 'username',
        password: 'password',
      );

      expect(result, isA<Right>());
    });

    test('returns failure when login api throws an exception', () async {
      final mockLoginApi = MockLoginApi();
      final mockUserTokenStorageProvider = MockUserTokenStorageProvider();
      final loginFacade = LoginFacade(
        loginApi: mockLoginApi,
        userTokenStorageProvider: mockUserTokenStorageProvider,
      );

      when(mockLoginApi.login(
        username: anyNamed('username'),
        password: anyNamed('password'),
      )).thenThrow(Exception());

      final result = await loginFacade.login(
        username: 'username',
        password: 'password',
      );

      expect(result, isA<Left>());
    });
  });
}
