import 'package:flutter/material.dart';
import 'package:registro/generated/l10n.dart';
import 'package:registro/models/servicio_model.dart';
import 'package:registro/constants.dart';
import 'dart:async';
import 'package:registro/screens/ListServicios/ServiciosList.dart';
import 'package:registro/sideServicio.dart';
import 'package:registro/screens/ListServicios/ServiciosList.dart';
import 'background.dart';

//class Body extends StatelessWidget {
//   Future<Servicio> servicio;

//   Body({Key? key, this.servicio}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Background(
//       child: Center(
//           child: FutureBuilder(
//               future: getServicios(),
//               builder: (BuildContext context, AsyncSnapshot snapshot) {
//                 print(snapshot.data);
//                 if (snapshot.data == null) {
//                   return Container(
//                       child: Center(child: CircularProgressIndicator()));
//                 } else {
//                   return ListView.builder(
//                     itemCount: snapshot.data.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return ListTile(
//                         leading: CircleAvatar(
//                           backgroundImage:
//                               NetworkImage(snapshot.data[index].imageUrl),
//                         ),
//                         title: Text(
//                           snapshot.data[index].name,
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         subtitle: Text(snapshot.data[index].address,
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 15,
//                             )),
//                         trailing: IconButton(
//                             color: Colors.white,
//                             icon: Icon(Icons.favorite_border),
//                             onPressed: () {
//                             }),
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               new MaterialPageRoute(
//                                   builder: (context) =>
//                                       DetailPage(snapshot.data[index])));
//                         },
//                       );
//                     },
//                   );
//                 }
//               })),
//     );
//   }
// }
// class DetailPage extends StatelessWidget {
//   final Servicio servicio;

//   DetailPage(this.servicio);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       drawer: SideServicio(),
//       appBar: AppBar(
//         backgroundColor: PrimaryColor,
//         title: Text(
//           servicio.name,
//           style: const TextStyle(
//               color: Colors.white,
//               fontSize: 28.0,
//               fontWeight: FontWeight.bold,
//               letterSpacing: -1.2),
//         ),
//         // actions: [
//         //   IconButton(
//         //       color: Colors.white,
//         //       icon: Icon(Icons.edit),
//         //       alignment: Alignment.centerRight,
//         //       onPressed: () {
//         //         Navigator.push(
//         //             context,
//         //             new MaterialPageRoute(
//         //                 builder: (context) => AforoPage(servicio)));
//         //       }),
//         // ],
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//         child: ListView(
//           children: <Widget>[
//             Text(
//               "Este servicio ha sido reportado por otro usuario",
//               style: TextStyle(
//                 backgroundColor: Colors.red[600],
//                 color: Colors.white,
//                 fontSize: 18,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             Divider(
//               color: Colors.black,
//             ),
//             CircleAvatar(
//               radius: 100.0,
//               backgroundImage: NetworkImage(servicio.imageUrl),
//             ),
//             Divider(
//               color: Colors.purple[200],
//             ),
//             Text(
//               "Nombre del servicio: ",
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold),
//             ),
//             Text(
//               servicio.name,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//               ),
//             ),
//             Divider(
//               color: Colors.purple[200],
//             ),
//             Text(
//               "Dirección: ",
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold),
//             ),
//             Text(
//               servicio.address,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//               ),
//             ),
//             Divider(
//               color: Colors.purple[200],
//             ),
            
//             Divider(
//               color: Colors.yellow[200],
//             ),
//             Text(
//               "Nombre:",
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold),
//             ),
//             Text(
//               servicio.owner,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//               ),
//             ),
//             Divider(
//               color: Colors.purple[200],
//             ),
//             Text(
//               "Descripción: ",
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold),
//             ),
//             Text(servicio.descripcion,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                 )),
//             Divider(
//               color: Colors.purple[200],
//             ),
//                     const SizedBox(
//                       height: 16,
//             ),
//             MaterialButton(
//                       height: 49,
//                       minWidth: 285,
//                       color: const Color(0xFFFFFFFF).withOpacity(0.20),
//                       elevation: 0,
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
//                       child: Text(
//                           S.current.login, 
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.white,
//                             ),
//                            ),
//                       onPressed: () {
                        
//                         enviarAgresion(servicio);
//                         getServicios();
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) {
//                               return ListaServiciosScreen();
//                             },
//                           ),
//                         );
//                       },
//                     ),
            
//           ],
//         ),
//       ),
//     );
//   }
//}
