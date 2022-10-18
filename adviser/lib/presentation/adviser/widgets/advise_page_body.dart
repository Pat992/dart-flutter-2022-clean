import 'package:adviser/application/adviser/adviser_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'advise_field.dart';
import 'custom_button.dart';
import 'error_message.dart';

class AdvisePageBody extends StatelessWidget {
  const AdvisePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: BlocBuilder<AdviserBloc, AdviserState>(
                  // With ..add, you can execute the event right on loaded
                  bloc: BlocProvider.of<AdviserBloc>(context),
                  //..add(AdviserRequestedEvent()),
                  builder: (context, state) {
                    if (state is AdviserStateLoading) {
                      return CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.secondary);
                    } else if (state is AdviserStateLoaded) {
                      return AdviseField(advise: state.advise);
                    } else if (state is AdviserStateError) {
                      return ErrorMessage(errorMsg: state.errorMessage);
                    }
                    return Text('Your advise is waiting!',
                        style: Theme.of(context).textTheme.headline1);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: Center(
                child: CustomButton(
                  onTap: () =>
                      BlocProvider.of<AdviserBloc>(context, listen: false)
                          .add(AdviserRequestedEvent()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
