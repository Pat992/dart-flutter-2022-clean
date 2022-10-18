import 'package:flutter/material.dart';
import 'package:todo/presentation/core/custom_button.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({Key? key}) : super(key: key);

  String? validateEmail(String? input) {
    const emailRegex =
        r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

    if (input == null || input.isEmpty) {
      return 'Please enter an E-Mail';
    } else if (RegExp(emailRegex).hasMatch(input)) {
      return null;
    }
    return 'Please enter a valid E-Mail';
  }

  String? validatePassword(String? input) {
    if (input == null || input.isEmpty) {
      return 'Please enter a Password';
    } else if (input.length >= 6) {
      return null;
    }
    return 'Please enter a Password with at least 6 characters';
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 80),
            Text(
              'Welcome',
              textAlign: TextAlign.center,
              style: themeData.textTheme.headline1?.copyWith(
                fontSize: 50,
                fontWeight: FontWeight.w500,
                letterSpacing: 4,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Please register or sign in',
              textAlign: TextAlign.center,
              style: themeData.textTheme.headline1?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 4,
              ),
            ),
            const SizedBox(height: 80),
            TextFormField(
              validator: validateEmail,
              autovalidateMode: AutovalidateMode.disabled,
              cursorColor: themeData.textTheme.headline1?.color,
              decoration: const InputDecoration(label: Text('E-Mail')),
            ),
            const SizedBox(height: 20),
            TextFormField(
              validator: validatePassword,
              autovalidateMode: AutovalidateMode.disabled,
              cursorColor: themeData.textTheme.headline1?.color,
              obscureText: true,
              decoration: const InputDecoration(label: Text('Password')),
            ),
            const SizedBox(height: 40),
            CustomButton(
              text: 'Sign in',
              callback: () {
                if (formKey.currentState!.validate()) {
                  print('sign in');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.redAccent,
                      content: Text(
                        'Invalid inputs',
                        style: themeData.textTheme.bodyText1,
                      ),
                    ),
                  );
                  print('invalid');
                }
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Register',
              callback: () {
                if (formKey.currentState!.validate()) {
                  print('register');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.redAccent,
                      content: Text(
                        'Invalid inputs',
                        style: themeData.textTheme.bodyText1,
                      ),
                    ),
                  );
                  print('invalid');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
