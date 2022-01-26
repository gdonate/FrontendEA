import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:registro/models/auth_manager.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({Key? key, required this.service}) : super(key: key);
  final Map<dynamic, dynamic> service;

  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  TextEditingController comentar = TextEditingController();
  @override
  void dispose() {
    comentar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List comments = widget.service['comments'];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.service['description']),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              width: size.width * 0.4,
              height: size.height * 0.3,
              color: Colors.black,
              margin: EdgeInsets.all(10.0),
              child: Builder(builder: (context) {
                var imgUrl = widget.service['img_url'];
                Image img;
                if (imgUrl.contains('asset')) {
                  img = Image.asset(imgUrl);
                } else {
                  img = Image.network(Constants.BASE_URL_MOBILE + imgUrl);
                }
                return img;
              }),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Comprar',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Text(widget.service['time_cost'].toString() + ' TIME UNITS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  print(comentar.text);
                },
                child: Text(
                  'Commentar',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                width: size.width * 0.35,
                child: TextField(
                  controller: comentar,
                  decoration: InputDecoration(
                    label: Text('valoracion'),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Denunciar',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                width: size.width * 0.35,
                child: TextField(
                  decoration: InputDecoration(
                    label: Text('Denuncia'),
                  ),
                ),
              ),
            ],
          ),
          Container(
            color: Colors.red,
            width: size.width,
            height: size.height * 0.3,
            child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Text(comments[index]),
                  );
                }),
          )
        ],
      ),
    );
  }
}

Future<void> addRating(BuildContext context, AuthManager authManager, String id,
    String comment) async {
  var url = Uri.parse((kIsWeb)
      ? Constants.BASE_URL_WEB + 'api/user/serv/comment/' + id
      : Constants.BASE_URL_MOBILE + 'api/user/serv/comment/' + id);

  Map<String, String> cookies = (kIsWeb)
      ? Map<String, String>()
      : {
          'Cookie': 'accessToken=' +
              authManager.inAcessToken.value.toString() +
              '; ' +
              'refreshToken=' +
              authManager.inRefreshToken.value.toString()
        };

  Map<String, String> body = {"comment": comment};

  var response = await http.put(url,
      headers: (kIsWeb)
          ? Constants.reqHeaders
          : {...Constants.reqHeaders, ...cookies},
      body: body);

  if (kIsWeb) return;
  //Get cookies
  if (response.statusCode == 200) {
    SnackBar snackBar = SnackBar(content: Text('Success'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } else {
    SnackBar snackBar = SnackBar(content: Text('Something went wrong'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

Future<void> addComment() async {}
Future<void> buyService() async {}
