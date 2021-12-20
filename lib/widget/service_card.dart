import 'package:flutter/material.dart';
import 'category_card.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({Key? key, required this.imgUrl, required this.description})
      : super(key: key);

  final String imgUrl;
  final String description;

  @override
  Widget build(BuildContext context) {
    return CategoryCard(
        svgSrc: this.imgUrl, title: this.description, press: () {});
  }
}
