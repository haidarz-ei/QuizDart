import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ujian_api_2410910040026/pages/todos/todos.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();

  bool isLoading = false;

  Future<void> registerUser() async {
    setState(() => isLoading = true);

    var url = Uri.parse("https://dummyjson.com/users/add");
    Map<String, dynamic> body = {
      "firstName": firstnameController.text,
      "lastName": lastnameController.text,
      "age": int.tryParse(ageController.text) ?? 0,
      "email": emailController.text
    };

    try {
      var response = await http.post(url, headers: {"Content-Type": "application/json"}, body: jsonEncode(body),);

      if (response.statusCode == 201) {
        var user = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: 
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.greenAccent,
              ),
              padding: EdgeInsets.all(16),
              child: Text("Berhasil Mendaftar: ${user['firstName']}"))),
        );
        Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_) => TodosPage()),
        );
      } else {
        throw Exception("Gagal daftar");
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 500,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 60),
                Text("Yuk Registrasi", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                
                SizedBox(height: 40),
        
                TextField(
                  controller: firstnameController,
                  decoration: InputDecoration(
                    labelText: "First Name",             
                    hintText: "Masukkan nama depan",          
                    border: OutlineInputBorder(          
                      borderRadius: BorderRadius.circular(12),
                    ),
                  )
                    
        
                ),
                
                SizedBox(height: 20),
        
                TextField(
                  controller: lastnameController, 
                  decoration: InputDecoration(
                    labelText: "Last Name",   
                    hintText: "masukan nama belakang",       
                    border: OutlineInputBorder(          
                      borderRadius: BorderRadius.circular(12),
                    ),
        
                  )
                ),
        
                SizedBox(height: 20),
        
                TextField(
                  controller: ageController, 
                  keyboardType: TextInputType.number, 
                  decoration: InputDecoration(
                    labelText: "Age",
                    hintText: "Masukkan umur",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  )
                ),
        
                SizedBox(height: 20),
                
                TextField(controller: emailController, 
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Masukan Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  )
                ),
        
                SizedBox(height: 30),
        
                SizedBox(width: double.infinity,height: 50,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : registerUser,
                    child: isLoading ? CircularProgressIndicator(color: Colors.white) : Text("Register"),
                  ),
                ),
        
              ],
            ),
          ),
        ),
      ),
    );
  }
}
