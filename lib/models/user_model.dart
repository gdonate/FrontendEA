import 'package:flutter/material.dart';

class User {
  final String id;
  final String username;
  final String password;
  final String email;
  final String imageUrl;
  final int time;

  //User(this.id, this.username, this.password, this.email, this.name, this.edad, this.descripcion, this.imageUrl, this.puntuacion);

  User({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.imageUrl,
    required this.time,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      username: json['username'],
      password: json['password'],
      email: json['email'],
      imageUrl: (json['imageUrl'] != null) ? json['imageUrl'] : '',
      time: json['time'],
    );
  }
}
