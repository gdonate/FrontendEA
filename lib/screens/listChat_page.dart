import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:registro/models/user_model.dart';
import 'package:registro/screens/welcome_screen.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ListChatPage extends StatefulWidget {
  final String user;
  bool usernameAlreadySelected = false;
  int num = 0;

  ListChatPage({Key? key, required this.user}) : super(key: key);

  @override
  _ListChatPageState createState() => _ListChatPageState();
}

class _ListChatPageState extends State<ListChatPage> {
  List users = [];
  late IO.Socket socket;

  @override
  void initState() {
    // TODO: implement initState
    if (!widget.usernameAlreadySelected) {
      socketio();
    }
    setUpSocketListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              logOut();
            },
          ),
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(users[index]["username"]),
              subtitle: Row(
                children: <Widget>[
                  Icon(
                    Icons.info_rounded,
                    size: 10,
                    color:
                        (users[index]["connected"]) ? Colors.green : Colors.red,
                  ),
                  Text((users[index]["connected"])
                      ? "Connected"
                      : "Disconnected"),
                ],
              ),
              leading: Icon(Icons.supervised_user_circle_outlined),
              onTap: () {},
            );
          },
        ),
      ),
    );
  }

  void socketio() {
    String username = widget.user;
    widget.usernameAlreadySelected = true;

    socket = IO.io(
        'http://localhost:4008',
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect() // disable auto-connection
            .build());

    //We attach the username in the auth object, and then call socket.connect()
    socket.auth = {"username": username};
    socket.connect();
  }

  void setUpSocketListener() {
    socket.on(
      "user connected",
      (data) {
        setState(() {
          users = data;
        });
      },
    );
    socket.on(
      "user disconnected",
      (usersC) {
        print(usersC);

        setState(() {
          users = usersC;
        });
      },
    );
  }

  void logOut() {
    socket.emit("bye");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WelcomeScreen(),
      ),
    );
  }
}
