import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/application/todo/controller/controller_bloc.dart';
import 'package:todo/domain/entities/todo/todo_entity.dart';
import 'package:todo/presentation/routes/router.gr.dart';

class TodoItem extends StatelessWidget {
  final TodoEntity todoEntity;
  const TodoItem({Key? key, required this.todoEntity}) : super(key: key);

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
      borderRadius: BorderRadius.circular(15),
      onLongPress: () {
        // Get controllerBloc of context
        final controllerBloc = context.read<ControllerBloc>();
        _showDeleteDialog(context: context, controllerBloc: controllerBloc);
      },
      onTap: () =>
          AutoRouter.of(context).push(TodoDetailsPageRoute(todo: todoEntity)),
      child: Material(
        borderRadius: BorderRadius.circular(15),
        elevation: 16,
        child: Container(
          decoration: BoxDecoration(
            color: todoEntity.color.color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  todoEntity.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: themeData.textTheme.headline1?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  todoEntity.body,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: themeData.textTheme.bodyText2?.copyWith(
                    fontSize: 16,
                  ),
                ),
                // takes all the Space, the following widgets will be at the end
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    // SizedBox overrides the padding of the checkbox
                    SizedBox(
                      height: 20,
                      width: 20,
                      // Needed to change size of checkbox
                      child: Transform.scale(
                        scale: 1.3,
                        child: Checkbox(
                          shape: const CircleBorder(),
                          activeColor: Colors.white,
                          checkColor: themeData.scaffoldBackgroundColor,
                          value: todoEntity.done,
                          onChanged: (val) {
                            if (val != null) {
                              BlocProvider.of<ControllerBloc>(context).add(
                                  UpdateTodoEvent(todo: todoEntity, done: val));
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
