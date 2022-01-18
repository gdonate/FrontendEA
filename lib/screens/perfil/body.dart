import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:registro/constants.dart';
import 'package:registro/screens/perfil/profile_pic.dart';
import 'package:registro/util/navegate.dart';

class Body extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return Column(
      children: [
        ProfilePic(),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: MaterialButton(
            padding: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Color(0xFFF5F6F9),
          onPressed: () {
            Navegate.goToHistorico(context);
          },
          child: Row(
            children: [
              SvgPicture.asset('assets/icons/TimeIcon.svg',
              width: 10,
              ),
              
              SizedBox(width: 20),
              Expanded(
                child: Text(
                  "Histórico",
              ),              
              ),

            ],
            
          ),
          
          
        ),
        )
        
      ],
      );
  }
}

