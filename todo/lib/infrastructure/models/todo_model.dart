import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/domain/entities/auth/id_entity.dart';
import 'package:todo/domain/entities/todo/color_entity.dart';
import 'package:todo/domain/entities/todo/todo_entity.dart';

class TodoModel {
  final String id;
  final String title;
  final String body;
  final bool done;
  final int color;
  final dynamic serverTimestamp;

  TodoModel({
    required this.id,
    required this.title,
    required this.body,
    required this.done,
    required this.color,
    required this.serverTimestamp,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: '',
      title: json['title'] as String,
      body: json['body'] as String,
      done: json['done'] as bool,
      color: json['color'] as int,
      serverTimestamp: json['serverTimestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'done': done,
      'color': color,
      'serverTimestamp': serverTimestamp,
    };
  }

  TodoModel copyWith({
    String? id,
    String? title,
    String? body,
    bool? done,
    int? color,
    dynamic serverTimestamp,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      done: done ?? this.done,
      color: color ?? this.color,
      serverTimestamp: serverTimestamp ?? this.serverTimestamp,
    );
  }

  factory TodoModel.fromFireStore(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    return TodoModel.fromJson(doc.data()).copyWith(id: doc.id);
  }

  TodoEntity toDomain() {
    return TodoEntity(
      id: IdEntity.fromUniqueString(id),
      color: ColorEntity(color: Color(color).withOpacity(1)),
      body: body,
      done: done,
      title: title,
    );
  }

  factory TodoModel.fromDomain(TodoEntity todoEntity) {
    return TodoModel(
      id: todoEntity.id.value,
      title: todoEntity.title,
      body: todoEntity.body,
      done: todoEntity.done,
      color: todoEntity.color.color.value,
      serverTimestamp: FieldValue.serverTimestamp(),
    );
  }
}
