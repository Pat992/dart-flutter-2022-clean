import 'package:flutter/material.dart';

class RowExpandedExample extends StatelessWidget {
  const RowExpandedExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(color: Colors.yellow, width: 50, height: 100),
        const SizedBox(width: 10),
        Expanded(flex: 2, child: Container(color: Colors.green, height: 100)),
        const SizedBox(width: 10),
        Expanded(flex: 1, child: Container(color: Colors.red, height: 100)),
        const SizedBox(width: 10),
        Container(color: Colors.yellow, width: 50, height: 100),
      ],
    );
  }
}
