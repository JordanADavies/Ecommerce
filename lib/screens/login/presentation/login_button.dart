import 'package:ecommerce/screens/login/application/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  final Function() onPressed;

  const LoginButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (_, state) {
      if (state is LoginLoggingIn) {
        return const Center(child: CircularProgressIndicator());
      }

      if (state is LoginSuccess) {
        return const Icon(
          Icons.check_circle_rounded,
          size: 50.0,
          color: Colors.green,
        );
      }

      return TextButton(
        onPressed: onPressed,
        child: const Text('Login'),
      );
    });
  }
}
