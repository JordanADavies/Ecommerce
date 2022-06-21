import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/screens/login/application/login_cubit.dart';
import 'package:ecommerce/screens/login/infrastructure/login_facade.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_cubit_test.mocks.dart';

@GenerateMocks([LoginFacade])
void main() {
  group('Login Cubit - Login', () {
    blocTest<LoginCubit, LoginState>(
      'emits logging in and success states when login facade returns success',
      build: () {
        final mockLoginFacade = MockLoginFacade();
        when(mockLoginFacade.login(
          username: anyNamed('username'),
          password: anyNamed('password'),
        )).thenAnswer((_) async => const Right(unit));
        return LoginCubit(loginFacade: mockLoginFacade);
      },
      act: (cubit) => cubit.login(username: 'username', password: 'password'),
      expect: () => [
        isA<LoginStateLoggingIn>(),
        isA<LoginStateSuccess>(),
      ],
    );

    blocTest<LoginCubit, LoginState>(
      'emits logging in and failed states when login facade returns failure',
      build: () {
        final mockLoginFacade = MockLoginFacade();
        when(mockLoginFacade.login(
          username: anyNamed('username'),
          password: anyNamed('password'),
        )).thenAnswer((_) async => const Left('Error'));
        return LoginCubit(loginFacade: mockLoginFacade);
      },
      act: (cubit) => cubit.login(username: 'username', password: 'password'),
      expect: () => [
        isA<LoginStateLoggingIn>(),
        isA<LoginStateFailed>(),
      ],
    );
  });
}
