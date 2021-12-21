import 'package:flutter/material.dart';

class User{
  final String id;
  final String username;
  final String password;
  final String email;
  final String nombre;
  final String edad;
  final String descripcion;
  final String imageUrl;
  final int puntuacion;

  //User(this.id, this.username, this.password, this.email, this.name, this.edad, this.descripcion, this.imageUrl, this.puntuacion);

  User({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.nombre,
    required this.edad,
    required this.descripcion,
    required this.imageUrl,
    required this.puntuacion,
  } 
  );

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],      
      password: json['password'],
      email: json['email'],
      nombre: json['nombre'],
      edad: json['edad'],
      descripcion: json['descripcion'],
      imageUrl: json['imageUrl'],
      puntuacion: json['puntuacion'],
    );
  }
}