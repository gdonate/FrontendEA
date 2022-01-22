import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:registro/constants.dart';
import 'package:registro/models/auth_manager.dart';
import 'package:registro/models/user_model.dart';
import 'package:registro/screens/camera.dart';
import 'package:registro/util/navegate.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthManager manager = Provider.of<AuthManager>(context);
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        children: [
          StreamBuilder<User?>(
              stream: manager.userModel$,
              builder: (context, snapshot) {
                ImageProvider? image;
                image = AssetImage("assets/images/luffy.jpg");
                if (snapshot.hasData) if (manager.isGoogleSession) {
                  image =
                      NetworkImage(manager.inGoogleUser!.photoUrl.toString());
                } else {
                  image = NetworkImage(
                      Constants.BASE_URL_MOBILE + snapshot.data!.imageUrl);
                }
                return CircleAvatar(backgroundImage: image);
              }),
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
                onPressed: () {
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
