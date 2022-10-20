import 'package:flutter/material.dart';
import 'package:todo/domain/entities/todo/todo_entity.dart';

class TodoDetailsPage extends StatelessWidget {
  final TodoEntity? todo;
  const TodoDetailsPage({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(todo != null ? 'Edit Todo' : 'Create Todo'),
      ),
      body: const Placeholder(),
    );
  }
}
