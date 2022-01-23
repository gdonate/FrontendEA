import 'dart:html';
import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Report reportFromJson(String str) => Report.fromJson(json.decode(str));

String reportToJson(Report data) => json.encode(data.toJson());

class Report {
  Report({
    required this.user,
    required this.report,
  });

  String user;
  String report;

  factory Report.fromJson(Map<String, dynamic> json) => Report(
        user: json["user"],
        report: json["report"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "report": report,
      };
}

class PaginaReportar extends StatefulWidget {
  @override
  _PaginaReportar createState() => _PaginaReportar();
}

Future<Report?> createReport(String user, String report) async {
  user = user == null ? "" : user;
  report = report == null ? "" : report;
  final String apiUri = "http://localhost:8080/api/report";

  final response = await http
      .post(Uri.parse(apiUri), body: {"user": user, "report": report});

  if (response.statusCode == 200) {
    final String responseString = response.body;
    return reportFromJson(responseString);
  } else {
    return null;
  }
}

class _PaginaReportar extends State<PaginaReportar> {
  Report? _report;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController reportController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reportar")),
      body: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            children: [
              TextField(
                controller: nameController,
              ),
              TextField(
                controller: reportController,
              ),
              SizedBox(
                height: 32,
              ),
              _report == null
                  ? Container()
                  : Text("${_report?.user}, ${"  ha creado una queja"}")
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final String user = nameController.text;
          final String report = reportController.text;
          final Report? reportCreated = await createReport(user, report);
          setState(() {
            _report = reportCreated;
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
