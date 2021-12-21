import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:registro/screens/ListServicios/components/body.dart';
import 'package:registro/sideServicio.dart';
import 'package:registro/constants.dart';
import 'package:registro/generated/l10n.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:registro/models/servicio_model.dart';

Future<List<Servicio>> getServicios() async {
  List<Servicio> servicios = [];
  final data = await http.get(Uri.parse('http://147.83.7.157:3000/servicios/'));
  var jsonData = json.decode(data.body);
  for (var u in jsonData) {
    print(data.body);
    Servicio servicio = Servicio(
        id: u["id"],
        name: u["name"],
        address: u["address"],
        owner: u["owner"],
        idOwner: u["idOwner"],
        descripcion: u["descripcion"],
        imageUrl: u["imageUrl"],
        agresion: u["agresion"]);

    servicios.add(servicio);
  }
  print(servicios.length);
  return servicios;
}

Future<Servicio> enviarAgresion(Servicio servicio) async {
  final data = await http.put(
    Uri.parse('http://147.83.7.157:3000/servicios/update/' + servicio.id),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'id': servicio.id,
      'name': servicio.name,
      'address': servicio.address,
      'owner': servicio.owner,
      'idOwner': servicio.idOwner,
      'descripcion': servicio.descripcion,
      'imageUrl': servicio.imageUrl,
      'agresion': DateTime.now().toString(),
    }),
  );

  if (data.statusCode == 201) {
    return Servicio.fromJson(jsonDecode(data.body));
  } else {
    throw Exception('Error al enviar la report');
  }
}

class ListaServiciosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideServicio(),
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text(
          "Lista de Servicios",
          style: const TextStyle(
              color: Colors.white,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2),
        ),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
