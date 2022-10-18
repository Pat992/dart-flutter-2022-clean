import 'package:flutter/material.dart';
import 'package:todo/presentation/general_widgets/custom_button.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Form(
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
              cursorColor: themeData.textTheme.headline1?.color,
              decoration: const InputDecoration(label: Text('E-Mail')),
            ),
            const SizedBox(height: 20),
            TextFormField(
              cursorColor: themeData.textTheme.headline1?.color,
              obscureText: true,
              decoration: const InputDecoration(label: Text('Password')),
            ),
            const SizedBox(height: 40),
            CustomButton(text: 'Sign in', callback: () => print('sign in')),
            const SizedBox(height: 20),
            CustomButton(text: 'Register', callback: () => print('register')),
          ],
        ),
      ),
    );
  }
}
