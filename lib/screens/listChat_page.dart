import 'package:flutter/material.dart';
import 'package:registro/models/user_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ListChatPage extends StatefulWidget {
  const ListChatPage({Key? key}) : super(key: key);

  @override
  _ListChatPageState createState() => _ListChatPageState();
}

class _ListChatPageState extends State<ListChatPage> {
  List<User> users = [];
  late IO.Socket socket;
  @override
  void initState() {
    // TODO: implement initState
    socket = IO.io(
        'http:localhost:4000',
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect() // disable auto-connection
            .build());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Item $index'),
              subtitle: Row(
                children: <Widget>[
                  Text("Conectado "),
                  Icon(
                    Icons.info_outline_sharp,
                    size: 10,
                    color: Colors.green,
                  ),
                ],
              ),
              leading: Icon(Icons.supervised_user_circle_outlined),
            );
          },
        ),
      ),
    ); // Text('Conectado')
  }
}
