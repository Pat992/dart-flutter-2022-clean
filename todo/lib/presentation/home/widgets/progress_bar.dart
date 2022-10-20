import 'package:flutter/material.dart';
import 'package:todo/domain/entities/todo/todo_entity.dart';
import 'package:todo/presentation/home/widgets/progress_bar_painter.dart';

class ProgressBar extends StatelessWidget {
  final List<TodoEntity> todos;
  const ProgressBar({Key? key, required this.todos}) : super(key: key);

  double _getDoneTodoPercentage({required List<TodoEntity> todos}) {
    int done = 0;
    double percentage = 0;

    for (final todo in todos) {
      if (todo.done) {
        ++done;
      }
    }

    percentage = (1 / todos.length) * done;
    return percentage;
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final borderRadius = BorderRadius.circular(10);

    return Material(
      elevation: 16,
      borderRadius: borderRadius,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: themeData.appBarTheme.backgroundColor,
          borderRadius: borderRadius,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'ToDos progress',
                style: themeData.textTheme.headline1?.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: LayoutBuilder(builder: (context, constraints) {
                  return Center(
                    child: CustomPaint(
                      painter: ProgressBarPainter(
                        barHeight: 25,
                        barWidth: constraints.maxWidth,
                        donePercent: _getDoneTodoPercentage(todos: todos),
                        bkgColor: Colors.grey,
                        percentageColor: Colors.tealAccent,
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
