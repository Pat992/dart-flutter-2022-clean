import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/application/todo/observer/observer_bloc.dart';
import 'package:todo/core/failures/failures.dart';
import 'package:todo/presentation/home/widgets/progress_bar.dart';
import 'package:todo/presentation/home/widgets/todo_item.dart';

import 'flexible_space.dart';

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
        // CustomScrollView for Slivers, the whole body will be scrollable
        return SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                collapsedHeight: 70,
                expandedHeight: 280,
                backgroundColor: themeData.scaffoldBackgroundColor,
                pinned: true,
                flexibleSpace: const FlexibleSpace(),
              ),

              SliverPadding(
                padding: const EdgeInsets.only(
                  right: _spacing,
                  left: _spacing,
                ),
                // Normal widgets are not allowed, need to ad an adapter
                sliver: SliverToBoxAdapter(
                  child: ProgressBar(todos: state.todos),
                ),
              ),
              // Obviously you have to use sliver-whatever widgets
              SliverPadding(
                padding: const EdgeInsets.only(
                  top: _spacing,
                  right: _spacing,
                  left: _spacing,
                  bottom: 100,
                ),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => TodoItem(
                      todoEntity: state.todos[index],
                    ),
                    // here the item count hides inside the SliverChildBuilderDelegate
                    childCount: state.todos.length,
                  ),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    crossAxisSpacing: _spacing,
                    mainAxisSpacing: _spacing,
                    childAspectRatio: 4 / 5,
                  ),
                ),
              ),
            ],
          ),
        );
      }
      return Container();
    });
  }
}
