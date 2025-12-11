import 'package:flutter/material.dart';
import 'package:ujian_api_2410910040026/helper/todo_helper.dart';
import 'package:ujian_api_2410910040026/models/todo_model.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo List", style: TextStyle(color: Colors.white),), backgroundColor: Colors.deepPurple),
      body: FutureBuilder<List<TodoModel>>(
        future: TodoHelper().getAllTodos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());

          if (snapshot.hasData) {
            List<TodoModel> todos = snapshot.data!;
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                var todo = todos[index];
                return ListTile(
                  leading: Icon(
                    todo.completed ? Icons.check_circle : Icons.cancel,
                    color: todo.completed ? Colors.green : Colors.red,
                  ),
                  title: Text(todo.todo, style: TextStyle(color: todo.completed ? Colors.green : Colors.black),),
                  
                );
              },
            );
          }

          return Center(child: Text("Tidak ada Todo List"));
        },
      ),
    );
  }
}
