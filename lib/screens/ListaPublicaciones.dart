import 'package:flutter/material.dart';
import 'package:registro/screens/ChatGroupScreen.dart';
import '../util/navegate.dart';

class ListaPublicaciones extends StatefulWidget {
  final String username;
  const ListaPublicaciones({ Key? key, required this.username}) : super(key: key);
  @override
  State<ListaPublicaciones> createState() => _ListaPublicacionesState();
}

class _ListaPublicacionesState extends State<ListaPublicaciones> {
  List<String> publicaciones = ["Deportes", "Tiempo", "Economía"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Publicaciones"),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: publicaciones.length,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepOrange)
                  ),
                  child: Row(
                    children: [
                      Text(publicaciones[index]),
                      ElevatedButton(
                          child: Text("Entrar"),
                          onPressed: (){
                            if(publicaciones[index] == "Deportes"){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => ChatGroupScreen(username: widget.username,room: "Deportes")));
                            }
                            else if(publicaciones[index] == "Tiempo"){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => ChatGroupScreen(username: widget.username,room: "Tiempo")));
                            }
                            else if(publicaciones[index] == "Economía"){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => ChatGroupScreen(username: widget.username,room: "Economia")));
                            }
                          },
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

