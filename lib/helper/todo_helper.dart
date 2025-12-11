import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ujian_api_2410910040026/models/todo_model.dart';

class TodoHelper {
  final String url = "https://dummyjson.com/todos";

  Future<List<TodoModel>> getAllTodos() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List todosJson = data['todos'];
      return todosJson.map((e) => TodoModel.fromMap(e)).toList();
    } else {
      throw Exception("Gagal ambil data todos");
    }
  }
}
