import 'package:flutter/material.dart';


class Servicio{
  final String id;
  final String name;
  final String address;
  final String owner;
  final String idOwner;
  final String descripcion;
  final String imageUrl;
  final String agresion;

  const Servicio({
    required this.id,
    required this.name,
    required this.address,
    required this.owner,
    required this.idOwner,
    required this.descripcion,
    required this.imageUrl,
    required this.agresion
    
  });

  factory Servicio.fromJson(Map<String, dynamic> json) {
    return Servicio(
      id: json['id'],
      name: json['name'],      
      address: json['address'],
      owner: json['owner'],
      idOwner: json['idOwner'],
      descripcion: json['descripcion'],
      imageUrl: json['imageUrl'],
      agresion: json['agresion']
    );
  }
}