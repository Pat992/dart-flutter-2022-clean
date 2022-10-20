import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/application/auth/auth_bloc.dart';
import 'package:todo/application/todo/controller/controller_bloc.dart';
import 'package:todo/application/todo/observer/observer_bloc.dart';
import 'package:todo/core/failures/failures.dart';
import 'package:todo/injection.dart';
import 'package:todo/presentation/home/widgets/home_body.dart';
import 'package:todo/presentation/routes/router.gr.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  String _mapFailureToMessage(Failure todoFailure) {
    switch (todoFailure.runtimeType) {
      case InsufficientPermissionsFailure:
        return "You do not have the permissions to do that";
      case UnexpectedFailure:
      default:
        return "Something went wrong";
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    // for initial event, the bloc needs to be initialized
    final observerBloc = getIt<ObserverBloc>()..add(ObserveAllEvent());

    return MultiBlocProvider(
      providers: [
        BlocProvider<ObserverBloc>(create: (context) => observerBloc),
        BlocProvider<ControllerBloc>(
            create: (context) => ControllerBloc(todoRepository: getIt()))
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
          BlocListener<ControllerBloc, ControllerState>(
            listener: (context, state) {
              if (state is ControllerFailureState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      _mapFailureToMessage(state.failure),
                    ),
                    backgroundColor: Colors.redAccent,
                  ),
                );
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
          floatingActionButton: FloatingActionButton(
            onPressed: () =>
                AutoRouter.of(context).push(TodoDetailsPageRoute(todo: null)),
            backgroundColor: themeData.colorScheme.secondary,
            child: const Icon(Icons.add, size: 26),
          ),
        ),
      ),
    );
  }
}
