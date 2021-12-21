import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:registro/util/navegate.dart';
import 'category_card.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({Key? key, required this.imgUrl, required this.description})
      : super(key: key);

  final String imgUrl;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(width: 150.0, child: Image.asset(imgUrl)),
          Text(description),
        ],
      ),
    );
  }
}
