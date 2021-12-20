import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class CategoryCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  final Function()? press;

  const CategoryCard(
      {Key? key, required this.svgSrc, required this.title, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        //padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              const BoxShadow(
                //color: Color.fromARGB(180, 130, 130, 130).withOpacity(0.5),
                offset: Offset(0, 17),
                blurRadius: 17,
                spreadRadius: -23,
                color: kShadowColor,
                // color: Colors.grey.withOpacity(0.5),
                // spreadRadius: 5,
                // blurRadius: 7,
                // offset: Offset(0, 3), // changes position of shadow
              ),
            ]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  //SvgPicture.asset(this.svgSrc),
                  //AssetImage("assets/images/undraw_pilates_gpdb.png"),
                  Image.asset(this.svgSrc),
                  Spacer(),
                  Text(this.title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(fontSize: 12))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
