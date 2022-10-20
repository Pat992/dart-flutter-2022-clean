import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/application/auth/auth_bloc.dart';

class FlexibleSpace extends StatelessWidget {
  const FlexibleSpace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return FlexibleSpaceBar(
      background: Padding(
        padding: const EdgeInsets.only(bottom: 90, top: 15),
        child: Image.asset('assets/images/todo.png'),
      ),
      titlePadding: const EdgeInsets.only(left: 20, bottom: 10),
      title: Row(
        children: <Widget>[
          Text(
            'ToDo',
            // scale between expanded to collapsed size
            textScaleFactor: 1.8,
            style: themeData.textTheme.headline1?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => BlocProvider.of<AuthBloc>(context, listen: false)
                .add(SignOutEvent()),
          )
        ],
      ),
    );
  }
}
