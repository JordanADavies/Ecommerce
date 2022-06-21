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

      when(mockLoginCubit.state).thenReturn(LoginInitial());
      when(mockLoginCubit.stream)
          .thenAnswer((_) => Stream.value(LoginInitial()));

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

      when(mockLoginCubit.state).thenReturn(LoginLoggingIn());
      when(mockLoginCubit.stream)
          .thenAnswer((_) => Stream.value(LoginLoggingIn()));

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

      when(mockLoginCubit.state).thenReturn(LoginSuccess());
      when(mockLoginCubit.stream)
          .thenAnswer((_) => Stream.value(LoginSuccess()));

      await tester.pumpWidget(testableWidget);

      expect(find.byType(Icon), findsOneWidget);
    });
  });
}
