import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/application/auth/auth_bloc.dart';
import 'package:todo/application/todo/observer/observer_bloc.dart';
import 'package:todo/injection.dart';
import 'package:todo/presentation/home/widgets/home_body.dart';
import 'package:todo/presentation/routes/router.gr.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final observerBloc = getIt<ObserverBloc>()..add(ObserveAllEvent());

    return MultiBlocProvider(
      providers: [
        BlocProvider<ObserverBloc>(create: (context) => observerBloc)
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthStateUnauthenticated) {
                AutoRouter.of(context).push(const SignupPageRoute());
              }
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () => BlocProvider.of<AuthBloc>(context, listen: false)
                  .add(SignOutEvent()),
            ),
            title: const Text('Todo'),
          ),
          body: const HomeBody(),
        ),
      ),
    );
  }
}
