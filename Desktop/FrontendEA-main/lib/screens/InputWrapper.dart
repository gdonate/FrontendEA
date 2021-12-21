import 'package:flutter/material.dart';
import 'RegisterButton.dart';
import 'LoginButton.dart';
import 'InputField.dart';

class InputWrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          SizedBox(height: 40,),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            child: InputField(),
          ),
          SizedBox(height: 20,),
          RegisterButton(),
          SizedBox(height: 40,),
          Text(
            "¿Has olvidado tu contraseña?",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}