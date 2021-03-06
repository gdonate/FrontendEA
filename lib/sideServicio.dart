import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:registro/Screens/ComunidadesList/comunidadeslist_screen.dart';
// import 'package:registro/Screens/Feed/feed_screen.dart';
// import 'package:registro/Screens/MisBares/misbares_screen.dart';
import 'package:registro/Screens/home_page.dart';
import 'package:registro/Screens/MapaScreen.dart';
import 'package:registro/Screens/perfil.dart';
import 'package:registro/models/auth_manager.dart';
import 'package:registro/screens/crearpublicacion.dart';
import 'package:registro/screens/welcome_screen.dart';
import 'package:registro/screens/image.dart';
import 'package:registro/screens/perfil/profile_screen.dart';
import 'package:registro/screens/camera.dart';
import 'package:registro/screens/Historico/historico.dart';
import 'package:registro/constants.dart';
import 'package:registro/data/data.dart';
// import 'package:registro/Screens/BarList/barlist_screen.dart';
// import 'package:permission_handler/permission_handler.dart';

import 'generated/l10n.dart';

class SideServicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthManager manager = Provider.of<AuthManager>(context);
    ImageProvider? image;
    image = AssetImage("assets/images/luffy.jpg");
    if (manager.userModel != null) if (manager.isGoogleSession) {
      image = NetworkImage(manager.inGoogleUser!.photoUrl.toString());
    } else {
      image =
          NetworkImage(Constants.BASE_URL_MOBILE + manager.userModel!.imageUrl);
    }
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              margin: const EdgeInsets.only(bottom: 0.0),
              accountName: manager.userModel != null
                  ? Text(
                      manager.userModel!.username.toString(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  : Text(currentUser.username),
              accountEmail: manager.userModel != null
                  ? Text(manager.userModel!.email.toString(),
                      style: TextStyle(
                        color: Colors.white,
                      ))
                  : Text(currentUser.email),
              currentAccountPicture:
                  CircleAvatar(radius: 20.0, backgroundImage: image),
              decoration: BoxDecoration(
                color: Color(0xFFF260D2B),
              )),
          ListTile(
            tileColor: Color(0xFFFFA50E),
            leading: Icon(
              Icons.home_filled,
              color: Colors.white,
            ),
            title: Text(
              "Inicio",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return HomeScreen();
              }),
            ),
          ),
          ListTile(
            tileColor: Color(0xFFFFA50E),
            leading: Icon(
              Icons.search,
              color: Colors.white,
            ),
            title: Text(
              "Buscador",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () => null,
          ),
          ListTile(
            tileColor: Color(0xFFFFA50E),
            leading: Icon(
              Icons.access_time,
              color: Colors.white,
            ),
            title: Text(
              "Crear Publicacion",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return Nuevo();
              }),
            ),
          ),
          ListTile(
            tileColor: Color(0xFFFFA50E),
            leading: Icon(
              Icons.money,
              color: Colors.white,
            ),
            title: Text(
              "Hist??rico",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return Historico();
              }),
            ),
          ),
          ListTile(
            tileColor: Color(0xFFFFA50E),
            leading: Icon(
              Icons.chat_bubble,
              color: Colors.white,
            ),
            title: Text(
              "Chat",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () => null,
          ),
          ListTile(
            tileColor: Color(0xFFFFA50E),
            leading: Icon(
              Icons.room_sharp,
              color: Colors.white,
            ),
            title: Text(
              "Mapa",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return MapaScreen();
              }),
            ),
          ),
          ListTile(
            tileColor: Color(0xFFFFA50E),
            leading: Icon(
              Icons.account_circle_rounded,
              color: Colors.white,
            ),
            title: Text(
              "Perfil",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ProfileScreen();
              }),
            ),
          ),
          Divider(
            height: 0.1,
            thickness: 2.0,
            color: Colors.white,
          ),
          ListTile(
            tileColor: Color(0xFFFFA50E),
            leading: Icon(
              Icons.settings_sharp,
              color: Colors.white,
            ),
            title: Text(
              "Configuraci??n",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () => null,
          ),
          ListTile(
              tileColor: Color(0xFFFFA50E),
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              title: Text(
                "Cerrar Sesi??n",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () async {
                if (manager.isGoogleSession) {
                  await manager.signOutWithGoogle(context);
                } else {
                  await manager.signOutWithAuthServer(context);
                }
              }),
        ],
      ),
    );
  }
}
