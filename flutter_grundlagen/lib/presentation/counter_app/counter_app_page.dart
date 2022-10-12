import 'package:flutter/material.dart';

class CounterAppPage extends StatefulWidget {
  const CounterAppPage({Key? key}) : super(key: key);

  @override
  State<CounterAppPage> createState() => _CounterAppPageState();
}

class _CounterAppPageState extends State<CounterAppPage> {
  int _counter = 0;

  void increment() {
    setState(() {
      ++_counter;
    });
  }

  void decrement() {
    setState(() {
      --_counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton(
              heroTag: "btnAdd",
              onPressed: increment,
              backgroundColor: Colors.blue,
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              heroTag: "btnSub",
              onPressed: decrement,
              backgroundColor: Colors.red,
              child: const Icon(Icons.remove),
            )
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(Icons.calculate),
        title: const Text('Counter App'),
      ),
      body: Center(
        child: Material(
          elevation: 15,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: _counter < 20 ? Colors.grey : Colors.blue,
            ),
            height: 200,
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Counter'),
                const SizedBox(height: 20),
                Text(
                  '$_counter',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
