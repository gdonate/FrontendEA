import 'package:flutter/material.dart';

import 'body.dart';

class ProfileScreen extends StatelessWidget {
  @override 
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
      ),
      body: Body(),
    );
  }
}