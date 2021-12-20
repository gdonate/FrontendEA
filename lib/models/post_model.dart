import 'package:flutter/material.dart';

class Post {
  final String nameServicio;
  final String idServicio;
  final String imageServicio;
  final String texto;
  final String fecha;
  final String imageUrl;
  final int likes;

  const Post({
    required this.nameServicio,
    required this.idServicio,
    required this.imageServicio,
    required this.texto,
    required this.fecha,
    required this.imageUrl,
    required this.likes
  });
}