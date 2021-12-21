import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:registro/screens/ListaPublicaciones.dart';
import '../util/navegate.dart';

class UsernameScreen extends StatefulWidget {
  const UsernameScreen({Key? key}) : super(key: key);

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  TextEditingController _controller = TextEditingController();
  late String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Introduce un nombre de usuario"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text("Introduce nombre de usuario"),
            ),
            Container(
              width: 300.0,
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                child: Text("Continuar"),
                onPressed: (){
                  if(_controller.value.text.isNotEmpty){
                    username = _controller.value.text;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ListaPublicaciones(username: username)));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
