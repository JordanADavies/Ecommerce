import 'package:ecommerce/screens/login/application/login_cubit.dart';
import 'package:ecommerce/screens/login/presentation/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String? _username = 'mor_2314';
  String? _password = '83r5^_';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: TextEditingController.fromValue(
                  const TextEditingValue(text: 'mor_2314')),
              onChanged: (value) => _username = value,
              validator: (value) => value == null || value.isEmpty
                  ? 'Username must be entered.'
                  : null,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              controller: TextEditingController.fromValue(
                  const TextEditingValue(text: '83r5^_')),
              onChanged: (value) => _password = value,
              obscureText: true,
              validator: (value) => value == null || value.isEmpty
                  ? 'Password must be entered.'
                  : null,
              textInputAction: TextInputAction.unspecified,
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 28.0),
            LoginButton(
              onPressed: () async {
                if (_formKey.currentState?.validate() == false) return;

                await context.read<LoginCubit>().login(
                      username: _username!,
                      password: _password!,
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
