import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool isLoading = false;

  Future<void> registerUser() async {
    setState(() {
      isLoading = true;
    });

    Map<String, dynamic> dataUser = {
      "firstName": firstnameController.text,
      "lastName": lastnameController.text,
      "age": ageController.text,
      "email": emailController.text
    };

    // Dummy JSON REGISTER API
    var url = Uri.parse("https://dummyjson.com/users/add");

    try {
      var respon = await http.post(url, body: dataUser);

      if (respon.statusCode == 201) {
        Navigator.pushReplacementNamed(context, "/todos");
      } else {
        throw Exception("Gagal daftar nih bos. coba lagi bos");
      }

    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text("📝 BUAT AKUN BARU", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,),),

              SizedBox(height: 40),

              TextFormField(
                controller: firstnameController,
                decoration: InputDecoration(
                  hintText: "Masukkan First Name",
                ),
              ),

              SizedBox(height: 20),

              TextFormField(
                controller: lastnameController,
                decoration: InputDecoration(
                  hintText: "Masukkan Last Name",
                ),
              ),

              SizedBox(height: 20),

              TextFormField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Masukkan Age",
                ),
              ),

              SizedBox(height: 20),

              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Masukkan Email",
                ),
              ),

              SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: isLoading ? null : registerUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                  ),
                  child: isLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text("Daftar"),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
