import 'package:flutter/material.dart';
import 'package:registro/util/navegate.dart';
import '';


class Nuevo extends StatefulWidget{
  const Nuevo({
    Key? key,
  }) : super(key: key);

  @override 
  _NuevoState createState() => _NuevoState();
}

class _NuevoState extends State<Nuevo>{


  GlobalKey formKey = GlobalKey<FormState>();

  @override 
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Crear una Publicación"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: "Título de la publicación"),
                ),
              TextField(
              decoration: InputDecoration(labelText: "Añade una descripción"),
              ), 
              TextField(
              decoration: InputDecoration(labelText: "Añade una ubicación"),
              ), 
              ElevatedButton(
                onPressed: (){
                  Navegate.goToPerfil(context);
                },
                child: Text('Crear Publicación', style: TextStyle(
                  color: Colors.white
                ),),
              ),
            ]
          )
        ),
        )
    );
  }
}

class FormBuilder extends StatelessWidget {
  const FormBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [],
    );
  }
}