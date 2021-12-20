import "package:flutter/material.dart";
import "package:text_editor/text_editor.dart";
import '../util/navegate.dart';
import 'welcome_screen.dart';
import 'dart:math';
import 'dart:async';
// import "../util/animacion_particulas.dart";

class SplashScreen extends StatefulWidget{
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen>{


@override 
void initState(){

  super.initState();
  Timer(Duration(seconds: 5), () => Navegate.goToWelcome(context));
}


@override
Widget build(BuildContext context){
  return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children:<Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFFFA50E),Color(0xFFF260D2B)])
            )
          ),
          
          // const AnimacionParticulas(50),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/logo.png',
                height: 250,
                width: 250,
                
                )
              ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              CircularProgressIndicator(
                color: Colors.white,
                ),
              SizedBox(
                height: 10,
              ),
              Text(
                'from', 
                style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                'GROUP 1 SOFTWARE', 
                style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 40.0))
              ],
          )

          ]
      )
  );
}
}