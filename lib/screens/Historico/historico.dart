import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:registro/api/user.dart';
import 'package:http/http.dart' as http;
import '../../sideServicio.dart';

class Historico extends StatelessWidget{
  Widget _bottomAction(IconData icon){
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
      child: Icon(icon),
      ),
      onTap: () {},
      );
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      
      drawer: SideServicio(),
      appBar: AppBar(
          backgroundColor: Color(0xFFFFA50E),
          title: Text("Histórico"),
          ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8.0,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _bottomAction(FontAwesomeIcons.history),
            _bottomAction(FontAwesomeIcons.chartPie),
            SizedBox(width: 48.0),
            _bottomAction(FontAwesomeIcons.wallet),
            _bottomAction(Icons.settings),

          ]
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      body: _body(),
    );
  }
  Widget _body() {
    return SafeArea(
      child: Column(
        children: <Widget>[
          _selector(),
          _expenses(),
          _graph(),
          Container(
            color: Colors.blueAccent.withOpacity(0.15),
            height: 24.0,
          ),
          _list(),
        ],
      ),
    );
  }

  Widget _selector() => Container();

  Widget _expenses() {
    return Column(
      children: <Widget>[
        Text("\$45,19",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 40.0,
        ),
        ),
        Text("Gastos totales",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
          color: Colors.blueGrey,
        ),
        ),
      ],
    );
  }

  Widget _graph() => Container();


  Widget _item(IconData icon, String name, String fecha, double value){
    return ListTile(
      leading: Icon(icon, size: 32.0,),
      title: Text(name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
      subtitle: Text(fecha,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.blueGrey,
        ) ,
      ),
      
      trailing:Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent.withOpacity(0.5),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("\$$value",
            style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w500,
              fontSize: 16.0,
            ),
          ),
        )
      ) 
      
      

    );
  }

  Widget _list() {
    return Expanded(
      child: ListView(
        children: <Widget>[
          _item(FontAwesomeIcons.code, "Programación", "21/12/21", 24.99),
          _item(FontAwesomeIcons.guitar, "Guitarra", "20/12/21", 17.2),
          _item(FontAwesomeIcons.futbol, "Futbol", "19/12/21", 2),
          _item(FontAwesomeIcons.dog, "Enseñar al perro", "18/12/21", 1),


        ],
      ),
    );
    
  }
  Future<List<User>> getUsers() async {
  List<User> users = [];

  final data = await http.get(Uri.parse('http://localhost:8080/users/'));
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
      fecha: u["fecha"],
      descripcion: u["descripcion"],
      imageUrl: u["imageUrl"],
      puntuacion: u["puntuacion"], 
      time: u["time"],
    );
    users.add(user);
  }
  print(users.length);
  users.sort((b, a) => a.fecha.compareTo(b.fecha));
  return users;
}
}