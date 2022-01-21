import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class Imagen extends StatefulWidget {
  @override
  _ImagenState createState() => _ImagenState();
}

class _ImagenState extends State<Imagen> {
  Widget _bottomAction(IconData icon) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(icon),
      ),
      onTap: () {},
    );
  }

  Future<int> submitProfilePicture(File file, String filename) async {
    ///MultiPart request
    var request = http.MultipartRequest(
      'PUT',
      Uri.parse(
          "http://10.0.2.2:8080/api/user/profilepic/61e6e0fe6ca90fd15c403934"),
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
    request.files.add(
      http.MultipartFile(
        'profilePicture',
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: filename,
        contentType: MediaType('image', 'jpeg'),
      ),
    );

    request.headers.addAll(headers);

    var res = await request.send();
    print("This is response:" + res.toString());
    return res.statusCode;
  }

  final ImagePicker _picker = ImagePicker();
  Future<void> selImagen(op) async {
    var photo;
    var image;
    if (op == 1) {
      photo = await _picker.pickImage(source: ImageSource.camera);
      await submitProfilePicture(photo, 'profilepicture');
    } else {
      image = await _picker.pickImage(source: ImageSource.gallery);
      await submitProfilePicture(image, 'profilepicture');
    }

    setState(() async {
      if (photo && image != null) {
        photo = File(photo.path);
        image = File(image.path);
      } else {
        print('No has seleccionado ninguna imágen');
      }
    });
    //todo Update userModel to have a new image
    //send image to the server
    Navigator.of(context).pop();
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecciona una Imagen'),
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
                  child: Text('Selecciona imagen'),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
