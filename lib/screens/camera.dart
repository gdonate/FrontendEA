import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:registro/constants.dart';
import 'package:registro/models/auth_manager.dart';
import 'package:registro/models/user_model.dart';

class Camara extends StatefulWidget {
  @override
  _CamaraState createState() => _CamaraState();
}

class _CamaraState extends State<Camara> {
  File? imagen = null;
  final picker = ImagePicker();
  Future selImagen(op) async {
    var pickedFile;
    if (op == 1) {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    }

    setState(() {
      if (pickedFile != null) {
        // imagen = File(pickedFile.path);
        cortar(File(pickedFile.path));
      } else {
        print('No has seleccionado ninguna imagen');
      }
    });

    Navigator.of(context).pop();
  }

  cortar(picked) async {
    File? cortado = await ImageCropper.cropImage(
        sourcePath: picked.path,
        aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0));
    if (cortado != null) {
      setState(() {
        imagen = cortado;
      });
    }
  }

  Future<int> submitProfilePicture(
      File file, String filename, String id, AuthManager manager) async {
    ///MultiPart request
    var request = http.MultipartRequest(
      'PUT',
      Uri.parse(Constants.BASE_URL_MOBILE + 'api/user/profilepic/' + id),
    );
    const Map<String, String> headers = {
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Credentials":
          "true", // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS",
      "Accept": "application/json",
    };

    Map<String, String> cookies = (kIsWeb)
        ? Map<String, String>()
        : {
            'Cookie': 'accessToken=' +
                manager.inAcessToken.value.toString() +
                '; ' +
                'refreshToken=' +
                manager.inRefreshToken.value.toString()
          };

    request.files.add(
      http.MultipartFile(
        'profilePicture',
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: 'profilePicture',
        contentType: MediaType('image', 'jpeg'),
      ),
    );

    request.headers.addAll(headers);
    request.headers.addAll(cookies);

    var res = await request.send();
    print("This is response:" + res.stream.toString());
    return res.statusCode;
  }

  opciones(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      selImagen(1);
                    },
                    child: Container(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Tomar una foto',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Icon(Icons.camera_alt, color: Colors.blue)
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      selImagen(2);
                    },
                    child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(width: 1, color: Colors.grey))),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Seleccionar una foto',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Icon(Icons.image, color: Colors.blue)
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(color: Colors.red),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Cancelar',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    AuthManager manager = Provider.of<AuthManager>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Fotografías'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    opciones(context);
                  },
                  child: Text(
                    'Selecciona una imagen',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                StreamBuilder<User>(
                    stream: manager.userModel$,
                    builder: (context, snapshot) {
                      return ElevatedButton(
                        onPressed: () async {
                          if (snapshot.hasData) {
                            if (imagen != null) {
                              int a = await submitProfilePicture(imagen!,
                                  imagen!.path, snapshot.data!.id, manager);
                              print(a.toString());
                            }
                          }
                        },
                        child: Text(
                          'Subir Imagen',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 30,
                ),
                imagen != null ? Image.file(imagen!) : Center()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
