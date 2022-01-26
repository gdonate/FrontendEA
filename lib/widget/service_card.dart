import 'package:flutter/material.dart';
import 'package:registro/constants.dart';
import 'category_card.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({Key? key, required this.imgUrl, required this.description})
      : super(key: key);

  final String imgUrl;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            margin: EdgeInsets.all(10.0),
            child: Builder(builder: (context) {
              Image img;
              if (imgUrl.contains('asset')) {
                img = Image.asset(imgUrl);
              } else {
                img = Image.network(Constants.BASE_URL_MOBILE + imgUrl);
              }
              return img;
            }),
          ),
          Text(this.description),
        ],
      ),
    );
  }
}
