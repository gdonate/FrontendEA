import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

class ChatSenderWidget extends StatefulWidget {
  final String username;
  final String message;
  const ChatSenderWidget({ Key? key, required this.username, required this.message }) : super(key: key);

  @override
  State<ChatSenderWidget> createState() => _ChatSenderWidgetState();
}

class _ChatSenderWidgetState extends State<ChatSenderWidget> {
  @override
  Widget build(BuildContext context) {
    return ChatBubble(
      clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
      alignment: Alignment.topRight,
      margin: EdgeInsets.only(top: 20),
      backGroundColor: Colors.orange,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Column(
          children: [
            Text(widget.username,
                style: TextStyle(color: Colors.white70, fontSize: 10.0)
            ),
            Text(
              widget.message,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}