import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

class ChatScreen extends StatefulWidget {
  final String room;
  const ChatScreen({ Key? key, required this.room }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  IO.Socket socket = IO.io(
      'http://localhost:8080',
      OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          .disableAutoConnect() // disable auto-connection
          .build());
  @override
  Widget build(BuildContext context) {
    socket.connect();
    socket.emit("room", widget.room);
    return Scaffold(
      appBar: AppBar(
        title: Text("Publicacione de "+ widget.room),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              child: TextFormField(
                controller: _controller,
                decoration: const InputDecoration(labelText: 'Send a message'),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          socket.emit("message", {
            "room": widget.room,
            "message": _controller
          });
        },
        tooltip: 'Send message',
        child: const Icon(Icons.send),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}

