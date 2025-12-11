import 'package:flutter/material.dart';
import 'package:ujian_api_2410910040026/pages/auth/register.dart';
import 'package:ujian_api_2410910040026/pages/todos/todos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      // home: LoginPage(),  
      routes: {
        "/" :(context)=>RegisterPage(),
        "/todos":(context)=>TodosPage(),
      },
      initialRoute: "/",
    );
  }
}
