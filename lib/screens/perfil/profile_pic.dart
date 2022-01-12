
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:registro/screens/camera.dart';
import 'package:registro/util/navegate.dart';


class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircleAvatar(
          backgroundImage: AssetImage("assets/images/luffy.jpg"),
      ),
      Positioned(
        right: 0,
        bottom: 0,
        child: SizedBox(
          height: 25,
          width: 25,
          child: MaterialButton(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: BorderSide(color: Colors.white)),
              color: Color(0xFFF5F6F9),
              onPressed: (){
                Navegate.goToCamara(context);
              },
              child: SvgPicture.asset('assets/icons/Camera Icon.svg'),
            ),
          ),
        )
        ],
      ),
    );
  }
}