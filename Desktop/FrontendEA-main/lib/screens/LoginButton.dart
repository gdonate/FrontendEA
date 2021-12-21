import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class LoginButton extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      },
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
          color: Color(0xFFF57F17),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text("Iniciar Sesion",style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold
          ),),
        ),
      ),
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