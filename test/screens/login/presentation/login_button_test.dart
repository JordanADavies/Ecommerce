import 'package:ecommerce/screens/login/application/login_cubit.dart';
import 'package:ecommerce/screens/login/presentation/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_button_test.mocks.dart';

@GenerateMocks([LoginCubit])
void main() {
  group('Login Button - State', () {
    testWidgets('shows login button when state is initial', (tester) async {
      final mockLoginCubit = MockLoginCubit();
      final testableWidget = BlocProvider<LoginCubit>(
        create: (_) => mockLoginCubit,
        child: MaterialApp(
          home: LoginButton(
            onPressed: () {},
          ),
        ),
      );

      when(mockLoginCubit.state).thenReturn(LoginStateInitial());
      when(mockLoginCubit.stream)
          .thenAnswer((_) => Stream.value(LoginStateInitial()));

      await tester.pumpWidget(testableWidget);

      expect(find.byType(TextButton), findsOneWidget);
      expect(find.text('Login'), findsOneWidget);
    });

    testWidgets('shows progress indicator button when state is logging in',
        (tester) async {
      final mockLoginCubit = MockLoginCubit();
      final testableWidget = BlocProvider<LoginCubit>(
        create: (_) => mockLoginCubit,
        child: MaterialApp(
          home: LoginButton(
            onPressed: () {},
          ),
        ),
      );

      when(mockLoginCubit.state).thenReturn(LoginStateLoggingIn());
      when(mockLoginCubit.stream)
          .thenAnswer((_) => Stream.value(LoginStateLoggingIn()));

      await tester.pumpWidget(testableWidget);

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows icon when state is success', (tester) async {
      final mockLoginCubit = MockLoginCubit();
      final testableWidget = BlocProvider<LoginCubit>(
        create: (_) => mockLoginCubit,
        child: MaterialApp(
          home: LoginButton(
            onPressed: () {},
          ),
        ),
      );

      when(mockLoginCubit.state).thenReturn(LoginStateSuccess());
      when(mockLoginCubit.stream)
          .thenAnswer((_) => Stream.value(LoginStateSuccess()));

      await tester.pumpWidget(testableWidget);

      expect(find.byType(Icon), findsOneWidget);
    });
  });
}
