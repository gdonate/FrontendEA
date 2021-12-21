import 'package:flutter/material.dart';
import 'package:registro/generated/l10n.dart';
import '../util/navegate.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({ Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFFFA50E),Color(0xFFF260D2B)]),
            ),
          ),
          Column(

            children: [

              Padding(padding: EdgeInsets.only(top: 60.0)),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,

                    children: <Widget>[
                      Image.asset(
                        'assets/logo.png',
                        height: 250,
                        width: 250,
                        ),
                    ],
                ),
              ),
            ],

          ),
          Column(
            children: [
          //     Expanded(
          //       flex: 2,
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //           children: <Widget>[
          //             const Text("Bienvenido"),
          //             const SizedBox(
          //               height: 8,

          //             ),
          //         Center(
          //           child: SizedBox(
          //             width: 245,
          //             child: RichText(
          //               textAlign: TextAlign.center,
          //               text: TextSpan(
          //               children: <TextSpan>[
          //                 TextSpan(
          //                   text: 'Cinco minutos bastan para soñar toda una vida',
          //                   style: TextStyle(
          //                     fontSize: 14,
          //                     fontWeight: FontWeight.w400,
          //                     color: Colors.white,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //         ),
          //   ]
          // ),
          // ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    MaterialButton(
                      height: 49,
                      minWidth: 285,
                      color: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                      child: Text(
                        S.current.register,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFF26D2B)
                          ),
                           ),
                      onPressed: () {
                        Navegate.goToRegister(context);
                      },
                    ),
                    const SizedBox(
                      height: 16,
                      ),
                    MaterialButton(
                      height: 49,
                      minWidth: 285,
                      color: const Color(0xFFFFFFFF).withOpacity(0.20),
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                      child: Text(
                          S.current.login,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            ),
                           ),
                      onPressed: () {
                        Navegate.goToLogin(context);
                      },
                    ),
                    const SizedBox(
                      height: 16,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Al iniciar sesión aceptas los ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          )),
                        ],
                      ),
                      const Text("términos y condiciones y la política de privacidad.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      )),
                       MaterialButton(
                      height: 49,
                      minWidth: 285,
                      color: const Color(0xFFFFFFFF).withOpacity(0.20),
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                      child: Text(
                          "HOME",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            ),
                           ),
                      onPressed: () {
                        Navegate.goToHome(context);
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    MaterialButton(
                      height: 49,
                      minWidth: 285,
                      color: const Color(0xFFFFFFFF).withOpacity(0.20),
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                      child: Text(
                        "Publicaciones",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navegate.goToUsername(context);
                      },
                    ),
                  ],
                ),
                ),
            ],
          ),
        ],
      ),
    );
  }
  }
