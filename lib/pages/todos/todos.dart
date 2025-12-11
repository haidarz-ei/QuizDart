import 'package:flutter/material.dart';
import 'package:ujian_api_2410910040026/helper/todo_helper.dart';
import 'package:ujian_api_2410910040026/models/todo_model.dart';


class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      body: FutureBuilder(
        future: TodoHelper().getTodos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData) {
            return Center(child: Text("Tidak ada data"));
          }

          List<TodoModel> todos = snapshot.data! as List<TodoModel>;

          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final item = todos[index];

              return ListTile(
                title: Text(
                  item.todo, style: TextStyle( color: item.completed ? Colors.green : Colors.black,
                    fontWeight: item.completed ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                trailing: Icon(item.completed
                      ? Icons.check_circle
                      : Icons.radio_button_unchecked,
                  color: item.completed ? Colors.green : Colors.red,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
