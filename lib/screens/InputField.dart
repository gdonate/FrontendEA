import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class InputField extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey[200]!))),
          child: TextField(
            controller: emailController,
            onChanged: (String value) async {
              email = emailController.text;
              return;
            },
            decoration: InputDecoration(
                hintText: "Introduce tu correo electrónico",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey[200]!))),
          child: TextField(
            controller: passwordController,
            onChanged: (String value) async {
              password = passwordController.text;
              return;
            },
            decoration: InputDecoration(
                hintText: "Introduce tu contraseña",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none),
          ),
        ),
        SizedBox(height: 20,),
        GestureDetector(
          onTap: () {
            loginUser(email,password);
          },
          child: Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              color: Color(0xFFF57F17),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "Iniciar Sesion",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ],
    );
  }
  Future<http.Response> loginUser(String email, String password) {
    return http.post(
      Uri.parse('http://localhost:8080/api/user/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password' : password
      }),
    );
  }
}
