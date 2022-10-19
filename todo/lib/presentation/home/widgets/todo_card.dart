import 'package:flutter/material.dart';
import 'package:todo/domain/entities/todo/todo_entity.dart';

class TodoCard extends StatelessWidget {
  final TodoEntity todoEntity;
  const TodoCard({Key? key, required this.todoEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Card(
      elevation: 16,
      color: todoEntity.color.color,
      child: ListTile(
        leading: Checkbox(value: todoEntity.done, onChanged: (val) {}),
        title: Text(
          todoEntity.title,
          style: themeData.textTheme.headline1?.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
