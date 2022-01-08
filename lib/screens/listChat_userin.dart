import 'package:flutter/material.dart';
import 'package:registro/screens/listChat_page.dart';

class UserIn extends StatefulWidget {
  const UserIn({Key? key}) : super(key: key);

  @override
  _UserInState createState() => _UserInState();
}

class _UserInState extends State<UserIn> {
  final textfieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              controller: textfieldController,
              decoration: InputDecoration(
                labelText: 'User',
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ListChatPage(user: textfieldController.text.toString()),
                  ),
                );
              },
              child: Text("Send"),
            ),
          ],
        ),
      ),
    );
  }
}
