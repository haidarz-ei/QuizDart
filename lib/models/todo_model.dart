import 'dart:convert';

class TodoModel {
  final int id;
  final String todo;
  final bool completed;

  TodoModel({
    required this.id,
    required this.todo,
    required this.completed,
  });

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'],
      todo: map['todo'],
      completed: map['completed'],
    );
  }
}
