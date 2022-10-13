import 'package:adviser/presentation/adviser/widgets/custom_button.dart';
import 'package:adviser/presentation/adviser/widgets/error_message.dart';
import 'package:flutter/material.dart';

class AdviserPage extends StatelessWidget {
  const AdviserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Adviser', style: Theme.of(context).textTheme.headline1),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            children: <Widget>[
              const Expanded(
                child: Center(
                  // child: Text(
                  //   'Your advise is waiting!',
                  //   style: Theme.of(context).textTheme.headline1,
                  // ),
                  // child: AdviseField(
                  //   advise:
                  //       'Get advise test sad dfgfdg aclj fhfdgdfg asdalk rgdfg',
                  // ),
                  child: ErrorMessage(),
                ),
              ),
              SizedBox(
                height: 200,
                child: Center(
                  child: CustomButton(
                    onTap: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
