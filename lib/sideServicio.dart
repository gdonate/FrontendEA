import 'package:flutter/material.dart';
// import 'package:registro/Screens/ComunidadesList/comunidadeslist_screen.dart';
// import 'package:registro/Screens/Feed/feed_screen.dart';
// import 'package:registro/Screens/MisBares/misbares_screen.dart';
import 'package:registro/Screens/home_page.dart';
import 'package:registro/Screens/MapaScreen.dart';
import 'package:registro/Screens/perfil.dart';
import 'package:registro/screens/welcome_screen.dart';
import 'package:registro/screens/image.dart';
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
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              margin: const EdgeInsets.only(bottom: 0.0),
              accountName: Text(currentUser.username),
              accountEmail: Text(currentUser.email),
              currentAccountPicture: CircleAvatar(
                radius: 20.0,
                backgroundImage: NetworkImage(currentUser.imageUrl),
              ),
              decoration: BoxDecoration(
                color:  Color(0xFFF260D2B),
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
              "Publicaciones",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
                
              },
          ),
          ListTile(
            tileColor: Color(0xFFFFA50E),
            leading: Icon(
              Icons.money,
              color: Colors.white,
            ),
            title: Text(
              "Histórico",
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
              Icons.money,
              color: Colors.white,
            ),
            title: Text(
              "Subir Imagen",
              style: TextStyle(color: Colors.white),
            ),
           onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return Camara();
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
              S.current.perfil,
              style: TextStyle(color: Colors.white),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return PerfilUser();
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
              "Configuración",
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
              "Cerrar Sesión",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return WelcomeScreen();
              }),
            ),
          ),
        ],
      ),
    );
  }
}
