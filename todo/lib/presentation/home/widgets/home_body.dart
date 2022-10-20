import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/application/todo/observer/observer_bloc.dart';
import 'package:todo/core/failures/failures.dart';
import 'package:todo/presentation/home/widgets/todo_card.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  String _mapFailureToMessage(Failure todoFailure) {
    switch (todoFailure.runtimeType) {
      case InsufficientPermissionsFailure:
        return "You have insufficient permissions, please try again later.";
      case UnexpectedFailure:
      default:
        return "Something went wrong, please try again later";
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return BlocBuilder<ObserverBloc, ObserverState>(builder: (context, state) {
      if (state is ObserverInitial) {
        return Container();
      } else if (state is ObserverLoadingState) {
        return Center(
          child: CircularProgressIndicator(
            color: themeData.colorScheme.secondary,
          ),
        );
      } else if (state is ObserverFailureState) {
        return Center(
          child: Text(_mapFailureToMessage(state.failure)),
        );
      } else if (state is ObserverSuccessState) {
        return ListView.builder(
            itemCount: state.todos.length,
            itemBuilder: (context, index) {
              return TodoCard(todoEntity: state.todos[index]);
            });
      }
      return Container();
    });
  }
}
