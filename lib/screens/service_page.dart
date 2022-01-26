import 'dart:async';

import 'package:flutter/material.dart';

import '../constants.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({Key? key, required this.service}) : super(key: key);
  final Map<dynamic, dynamic> service;

  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List comments = widget.service['comments'];
    comments.add('No me gusta como da clases');
    print(widget.service);

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
                onPressed: () {},
                child: Text(
                  'Valorar',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                width: size.width * 0.35,
                child: TextField(
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

Future<void> addRating() async {}
