import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:registro/models/auth_manager.dart';
import 'package:registro/util/navegate.dart';

class InputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthManager manager = Provider.of<AuthManager>(context);

    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey[200]!))),
          child: StreamBuilder(
              stream: manager.email$,
              builder: (context, snapshot) {
                return TextField(
                  onChanged: (String value) => manager.addEmail(value),
                  decoration: InputDecoration(
                    hintText: "Introduce tu correo electrónico",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    errorText: snapshot.error != null
                        ? snapshot.error.toString()
                        : null,
                  ),
                );
              }),
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey[200]!))),
          child: StreamBuilder(
              stream: manager.password$,
              builder: (context, snapshot) {
                return TextField(
                  obscureText: true,
                  onChanged: (String value) => manager.addPassword(value),
                  decoration: InputDecoration(
                    hintText: "Introduce tu contraseña",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    errorText: snapshot.error != null
                        ? snapshot.error.toString()
                        : null,
                  ),
                );
              }),
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () async {
            await manager.logUserIn(context);
          },
          child: Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              color: Color(0xFFF57F17),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "Iniciar Sesion",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () => manager.signInWithGoogle(context),
          child: Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              color: Color(0xFFF57F17),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "Continuar con Google",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
