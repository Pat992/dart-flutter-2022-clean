import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Icon(Icons.error, size: 40, color: Colors.redAccent),
        const SizedBox(height: 20),
        Text(
          'Ups, something has gone wrong. Please try again.',
          style: Theme.of(context).textTheme.headline1,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
