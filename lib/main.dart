import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:registro/constants.dart';
import 'package:registro/models/auth_manager.dart';
import 'package:registro/screens/Historico/historico.dart';
import 'package:registro/screens/MapaScreen.dart';
import 'package:registro/screens/auth_screen.dart';
import 'package:registro/screens/camera.dart';
import 'package:registro/screens/crearpublicacion.dart';
import 'package:registro/screens/perfil.dart';
import 'package:registro/screens/perfil/profile_screen.dart';
import 'package:registro/screens/splash_screen.dart';
import 'blocs/registro_bloc.dart';
import 'generated/l10n.dart';
import 'screens/registro.dart';
import 'screens/LoginPage.dart';
import 'screens/home_page.dart';
import 'screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await (kIsWeb
      ? Firebase.initializeApp(options: Constants.firebaseOptions)
      : Firebase.initializeApp());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    S.load(Locale('es', 'ES'));

    return MultiProvider(
      providers: [
        Provider<RegistroBloc>(create: (context) => RegistroBloc()),
        Provider<AuthManager>(
          create: (context) => AuthManager(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'inTime',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const SplashScreen(),
        routes: routes,
      ),
    );
  }
}

var routes = <String, WidgetBuilder>{
  "/welcome": (BuildContext context) => const WelcomeScreen(),
  "/login": (BuildContext context) =>
      LoginPage(), //Poner el nombre de la clase de login de su propia pantalla
  "/register": (BuildContext context) => Registro(),
  "/home": (BuildContext context) =>
      HomeScreen(), //Poner el nombre de la clase de register de su propia pantalla
  "/map": (BuildContext context) =>
      MapaScreen(), //Poner el nombre de la clase de register de su propia pantalla
  "/perfil": (BuildContext context) => ProfileScreen(),
  "/camera": (BuildContext context) =>
      Camara(), //Poner el nombre de la clase de register de su propia pantalla
  "/historico": (BuildContext context) => Historico(),
  "/publicaciones": (BuildContext context) => Nuevo(),
};
