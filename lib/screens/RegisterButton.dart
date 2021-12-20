import 'package:flutter/material.dart';
import '../util/navegate.dart';


class RegisterButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
        color: Color(0xFFF57F17),
        borderRadius: BorderRadius.circular(10),
      ),
      
      child: Center(
        
        child: Text("Crear una cuenta",style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
        ),
        ),
        
     
      ),
      
      
      );
  }
}