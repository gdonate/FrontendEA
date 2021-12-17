import 'package:flutter/material.dart';

class BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pop(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
            ),
            Text("Volver a inicio",style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500
            ),)
          ],
        ),
      ),
    );
  }
}