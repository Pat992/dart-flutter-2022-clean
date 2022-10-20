import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/application/todo/observer/observer_bloc.dart';
import 'package:todo/core/failures/failures.dart';
import 'package:todo/presentation/home/widgets/todo_item.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  static const double _spacing = 20;

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
        return Padding(
          padding: const EdgeInsets.all(_spacing),
          child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.todos.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: _spacing,
                mainAxisSpacing: _spacing,
                childAspectRatio: 4 / 5,
              ),
              itemBuilder: (context, index) {
                return TodoItem(
                  todoEntity: state.todos[index],
                );
              }),
        );
      }
      return Container();
    });
  }
}
