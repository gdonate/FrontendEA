import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:registro/models/auth_manager.dart';
import 'package:registro/models/create_app_form_block.dart';
import 'package:registro/util/navegate.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

import '../constants.dart';

class Nuevo extends StatefulWidget {
  const Nuevo({
    Key? key,
  }) : super(key: key);

  @override
  _NuevoState createState() => _NuevoState();
}

class _NuevoState extends State<Nuevo> {
  File? imagen = null;
  final picker = ImagePicker();

  Future selImagen() async {
    var pickedFile;
    pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        // imagen = File(pickedFile.path);
        cortar(File(pickedFile.path));
      } else {
        print('No has seleccionado ninguna imagen');
      }
    });
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

  @override
  Widget build(BuildContext context) {
    AuthManager authManager = Provider.of<AuthManager>(context);
    ServiceManager serviceManager = Provider.of<ServiceManager>(context);

    Future<int> submitService(File file, AuthManager manager) async {
      ///MultiPart request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(Constants.BASE_URL_MOBILE + 'api/user/serv'),
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
          'picture',
          file.readAsBytes().asStream(),
          file.lengthSync(),
          filename: 'profilePicture',
          contentType: MediaType('image', 'jpeg'),
        ),
      );

      Map<String, dynamic> profile = {
        "username": manager.userModel!.id,
        "description": serviceManager.inDescription,
        "time_cost": serviceManager.inTimeCost,
        "categories": [],
        "img_url": "",
        "ratings": [],
        "comments": [],
        "meanRate": 0
      };
      request.fields.addAll({"service": jsonEncode(profile)});

      request.headers.addAll(headers);
      request.headers.addAll(cookies);

      var res = await request.send();
      print("This is response:" + res.stream.toString());
      return res.statusCode;
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Crear una Publicación"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              child: Column(children: <Widget>[
            StreamBuilder<String>(
                stream: serviceManager.description$,
                builder: (context, snapshot) {
                  return TextField(
                    onChanged: (value) => serviceManager.addDescrition(value),
                    decoration:
                        InputDecoration(labelText: "Añade una descripción"),
                  );
                }),
            StreamBuilder<int>(
                stream: serviceManager.timeCost$,
                builder: (context, snapshot) {
                  return TextField(
                      onChanged: (value) =>
                          serviceManager.addTimeCost(int.parse(value)),
                      decoration:
                          InputDecoration(labelText: "Añade precio en horas"),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ]);
                }),
            ElevatedButton(
              onPressed: () async {
                selImagen();
              },
              child: Text(
                'Añade una imagen',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.45,
              child: (imagen != null)
                  ? Image.file(imagen!)
                  : Image.asset('assets/images/luffy.jpg'),
            ),
            ElevatedButton(
                onPressed: () async {
                  await submitService(imagen!, authManager);
                },
                child: Text(
                  'Crear Formulario',
                  style: TextStyle(color: Colors.white),
                ))
          ])),
        ));
  }
}



// const serviceSchema = new Schema<Service>({
//   username: { type: String, required: true },
//   description: { type: String, required: true },
//   time_cost: { type: Number, required: true },
// });