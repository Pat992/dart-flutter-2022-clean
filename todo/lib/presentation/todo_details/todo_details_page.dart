import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/application/todo/form/todo_form_bloc.dart';
import 'package:todo/core/failures/failures.dart';
import 'package:todo/domain/entities/todo/todo_entity.dart';
import 'package:todo/injection.dart';
import 'package:todo/presentation/routes/router.gr.dart';
import 'package:todo/presentation/todo_details/widgets/save_progress_overlay.dart';
import 'package:todo/presentation/todo_details/widgets/todo_form.dart';

class TodoDetailsPage extends StatelessWidget {
  final TodoEntity? todo;

  const TodoDetailsPage({Key? key, required this.todo}) : super(key: key);

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
    return BlocProvider(
      create: (context) =>
          getIt<TodoFormBloc>()..add(TodoFormInitializeDetailPage(todo: todo)),
      child: BlocConsumer<TodoFormBloc, TodoFormState>(
        // Only listen if success or failure is not the same as in previous state
        listenWhen: (prev, curr) =>
            prev.successOrFailureOption != curr.successOrFailureOption,
        listener: (context, state) {
          state.successOrFailureOption.fold(
            () => null,
            (some) => some.fold(
              (success) => Navigator.of(context).popUntil(
                  (route) => route.settings.name == HomePageRoute.name),
              (failure) => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(_mapFailureToMessage(failure)),
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ),
          );
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(todo != null ? 'Edit Todo' : 'Create Todo'),
          ),
          body: Stack(
            children: [
              const TodoForm(),
              SaveProgressOverlay(saving: state.isSaving),
            ],
          ),
        ),
      ),
    );
  }
}
