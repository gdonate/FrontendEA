import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:registro/generated/l10n.dart';

import '../sideServicio.dart';

class PerfilUser extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: SideServicio(),
        appBar: AppBar(
          backgroundColor: Color(0xFFFFA50E),
          title: Text(S.current.userprofile),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 190,
                padding: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/fondo.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                   Container(
                     width: 100,
                     height: 100,
                     decoration: BoxDecoration(
                       image: DecorationImage(
                         image: AssetImage('assets/images/perfilimage.jpg'),
                         fit: BoxFit.cover,
                         ),
                         shape: BoxShape.circle,
                         border: Border.all(
                           color: Colors.white,
                           width: 4,
                         ),
                        ),
                        margin: EdgeInsets.only(bottom: 5),
                   ), 
                   Text('Olivia Valle', 
                   style: TextStyle(
                     color: Colors.white,
                   ),
                  ),
                  ],
                ),
              ),
            ],
          ),
      )
    );
  }
  }
