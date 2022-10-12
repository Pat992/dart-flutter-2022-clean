import 'package:flutter/material.dart';

class ContainerTextExample extends StatelessWidget {
  const ContainerTextExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(color: Colors.black, width: 4),
        borderRadius: BorderRadius.circular(16),
      ),
      height: 180,
      //width: 300,
      alignment: Alignment.center,
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 10,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue[200],
            borderRadius: BorderRadius.circular(10),
          ),
          height: 100,
          width: 200,
          alignment: Alignment.center,
          child: const Text(
            'Example Text',
            style: TextStyle(),
          ),
        ),
      ),
    );
  }
}
