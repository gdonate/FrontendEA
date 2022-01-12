import 'dart:async';
import 'package:registro/socketioclient.dart';

import '../widget/chatSender_widget.dart';
import '../widget/chatReceiver_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

class ChatScreen extends StatefulWidget {
  final String username;
  final String contact;

  const ChatScreen({Key? key, required this.username, required this.contact})
      : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<String> _chatMessages = [];
  List<String> _senderMessage = [];
  late Stream<String> _messageStream;
  late StreamController<String> _messageController;
  late IO.Socket socket;

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    socket = SocketClient().getSocketClient();
    // IO.io(
    //     'http://localhost:8080',
    //     OptionBuilder()
    //         .setTransports(['websocket']) // for Flutter or Dart VM
    //         .disableAutoConnect() // disable auto-connection
    //         //.setQuery({"username": widget.username}) // optional
    //         .build());
    // socket.connect();
    socket.on(
        "msg",
        (data) => {
              if (data["sender"] == widget.contact)
                {
                  _messageController.add(data["message"]),
                  _chatMessages.add(data["message"]),
                  _senderMessage.add(widget.contact)
                }
            });
    _messageController = StreamController<String>();
    _messageStream = _messageController.stream;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          widget.contact,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/backgroundChat.jpg"), fit: BoxFit.fill),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: StreamBuilder(
                  stream: _messageStream,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: _chatMessages.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (_chatMessages.isNotEmpty) {
                              if (_senderMessage[index] == widget.username) {
                                return ChatSenderWidget(
                                    username: widget.username,
                                    message: _chatMessages[index]);
                              } else {
                                return ChateReceiverWidget(
                                    contact: widget.contact,
                                    message: _chatMessages[index]);
                              }
                            } else {
                              return Text("");
                            }
                          });
                    } else {
                      return SizedBox(
                        width: 15,
                      );
                    }
                  }),
            ),
            SizedBox(
              width: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.all(5.0),
                    decoration: const BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: TextField(
                      controller: _controller,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          hintText: "Mensaje",
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none),
                    ),
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    if (_controller.value.text.isNotEmpty) {
                      sendMessage(_controller.value.text);
                      _controller.clear();
                    }
                  },
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 18,
                  ),
                  backgroundColor: Colors.orange,
                  elevation: 0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void sendMessage(String message) {
    Map<String, dynamic> data = {
      "sender": widget.username,
      "receiver": widget.contact,
      "message": message
    };
    socket.emit("msg", data);
    _messageController.add(message);
    _chatMessages.add(message);
    _senderMessage.add(widget.username);
  }
}
