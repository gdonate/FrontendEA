import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ServiceFullScreen extends StatefulWidget {
  ServiceFullScreen({Key? key, required this.img, required this.description})
      : super(key: key);

  List<String> comments = ['This is good', 'This is bad', 'this is regular'];
  String img;
  String description;
  double userRating = 0;

  @override
  _ServiceFullScreenState createState() => _ServiceFullScreenState();
}

class _ServiceFullScreenState extends State<ServiceFullScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          child: Image.asset(widget.img),
        ),
        Text(
          widget.description,
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
        const Text(
          'Comments',
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: widget.comments.length,
            itemBuilder: (context, index) => Text(widget.comments[index])),
        const Text(
          'Rating: 5 stars',
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
        RatingBar.builder(
          initialRating: widget.userRating,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            setState(() {
              widget.userRating = rating;
            });
          },
        ),
        MaterialButton(
            child: Text('Rate this service'),
            onPressed: () {
              //Send to backend
            })
      ],
    ));
  }
}
