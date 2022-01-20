import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';


class ChateReceiverWidget extends StatefulWidget {
  final String contact;
  final String message;
  const ChateReceiverWidget({ Key? key, required this.contact, required this.message }) : super(key: key);

  @override
  State<ChateReceiverWidget> createState() => _ChateReceiverWidgetState();
}

class _ChateReceiverWidgetState extends State<ChateReceiverWidget> {
  @override
  Widget build(BuildContext context) {
    return ChatBubble(
      clipper: ChatBubbleClipper1(type: BubbleType.receiverBubble),
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(top: 20),
      backGroundColor: Colors.amber,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Column(
          children: [
            Text(widget.contact,
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