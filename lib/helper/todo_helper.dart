import 'dart:convert';
import 'package:ujian_api_2410910040026/models/todo_model.dart';
import 'package:http/http.dart' as http;

class TodoHelper {
  Future<List<TodoModel>> getAllUsers() async {

    var uri = Uri.parse("https://dummyjson.com/users");

    var respon = await http.get(uri);
    if (respon.statusCode == 200) {
      List<dynamic> hasil = jsonDecode(respon.body);
      return hasil.map((json) => TodoModel.fromMap(json)).toList();

    } else {
      throw Exception("Koneksi terganggu");
    }
  }

  Future<Object?>? getTodos() async {}
}
