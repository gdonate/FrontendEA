import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:registro/screens/ListServicios/components/body.dart';
import 'package:registro/sideServicio.dart';
import 'package:registro/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:registro/models/user_model.dart';
import 'package:registro/sideServicio.dart';

Future<List<User>> getUsers() async {
  List<User> users = [];

  final data = await http.get(Uri.parse('http://147.83.7.157:3000/usuarios/'));
  var jsonData = json.decode(data.body);
  for (var u in jsonData) {
    print(data.body);
    User user = User(
      id: u["id"],
      username: u["username"],
      password: u["password"],
      email: u["email"],
      nombre: u["nombre"],
      edad: u["edad"],
      descripcion: u["descripcion"],
      imageUrl: u["imageUrl"],
      puntuacion: u["puntuacion"],
    );
    users.add(user);
  }
  print(users.length);
  users.sort((b, a) => a.puntuacion.compareTo(b.puntuacion));
  return users;
}

class ListaUsuariosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideServicio(),
      appBar: AppBar(
        backgroundColor:  Color(0xFFFFA50E),
        title: Text(
          'Lista de Usuarios',
          style: const TextStyle(
              color: Colors.white,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2),
        ),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
