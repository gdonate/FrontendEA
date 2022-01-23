import 'dart:html';
import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Report {
  final String user;
  final String report;

  Report({required this.user, required this.report});

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(user: json['user'], report: json['report']);
  }
}

Future<List<Report>> fetchPost() async {

  try {
    final response =
        await http.get(Uri.parse('http://localhost:8080/api/report'));
    if (response.statusCode == 200) {
      final json = "[" + response.body + "]";
      return json as List<Report>;
    } else {
      throw Exception('Failed to get reports');
    }
  } on Exception catch (_) {
    print("throwing new error");
    throw Exception("Error on server");
  }
}

class PaginaDenuncia extends StatefulWidget {
  @override
  _PaginaDenuncia createState() => _PaginaDenuncia();
}

class _PaginaDenuncia extends State<PaginaDenuncia> {
  List userData = List.empty();

  getReports() async {
    http.Response response =
        await http.get(Uri.parse('http://localhost:8080/api/report'));
    userData = json.decode(response.body);
    print(userData);

    setState(() {
      userData;
    });
  }

  @override
  void initState() {
    super.initState();
    getReports();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Report"),
        backgroundColor: Colors.orange[400],
      ),
      body: ListView.builder(
        itemCount: userData == null ? 0 : userData.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Row(children: <Widget>[
              Text("$index"),
              CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://m.media-amazon.com/images/I/31hf3-SrVGL._SX342_.jpg"),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                    "  ${"user : "} ${userData[index]["user"]}  ${"report : "} ${userData[index]["report"]}",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700)),
              )
            ]),
          );
        },
      ),
    );
  }
}
