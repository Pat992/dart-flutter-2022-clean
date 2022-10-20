import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/application/todo/controller/controller_bloc.dart';
import 'package:todo/domain/entities/todo/todo_entity.dart';
import 'package:todo/presentation/routes/router.gr.dart';

class TodoCard extends StatelessWidget {
  final TodoEntity todoEntity;
  const TodoCard({Key? key, required this.todoEntity}) : super(key: key);

  void _showDeleteDialog(
      {required BuildContext context, required ControllerBloc controllerBloc}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Selected Todo to delete:'),
            content: Text(
              todoEntity.title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'CANCEL',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  controllerBloc.add(DeleteTodoEvent(todo: todoEntity));
                  Navigator.pop(context);
                },
                child: const Text(
                  'DELETE',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return InkWell(
      onLongPress: () {
        // Get controllerBloc of context
        final controllerBloc = context.read<ControllerBloc>();
        _showDeleteDialog(context: context, controllerBloc: controllerBloc);
      },
      onTap: () =>
          AutoRouter.of(context).push(TodoDetailsPageRoute(todo: todoEntity)),
      child: Card(
        elevation: 16,
        color: todoEntity.color.color,
        child: ListTile(
          leading: Checkbox(
              value: todoEntity.done,
              onChanged: (val) {
                if (val != null) {
                  BlocProvider.of<ControllerBloc>(context)
                      .add(UpdateTodoEvent(todo: todoEntity, done: val));
                }
              }),
          title: Text(
            todoEntity.title,
            style: themeData.textTheme.headline1?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
