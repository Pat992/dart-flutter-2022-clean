import 'package:todo/domain/entities/auth/id_entity.dart';
import 'package:todo/domain/entities/todo/color_entity.dart';

class TodoEntity {
  final IdEntity id;
  final String title;
  final String body;
  final bool done;
  final ColorEntity color;

  TodoEntity({
    required this.id,
    required this.color,
    required this.body,
    required this.done,
    required this.title,
  });

  factory TodoEntity.empty() {
    return TodoEntity(
      id: IdEntity(),
      color: ColorEntity(color: ColorEntity.predefinedColors[0]),
      body: '',
      done: false,
      title: '',
    );
  }

  TodoEntity copyWith({
    IdEntity? id,
    String? title,
    String? body,
    bool? done,
    ColorEntity? color,
  }) {
    return TodoEntity(
      id: id ?? this.id,
      color: color ?? this.color,
      body: body ?? this.body,
      done: done ?? this.done,
      title: title ?? this.title,
    );
  }
}
