import 'package:flutter/material.dart';

class Social extends StatelessWidget {
  Color color;
  String image;
  Color imagecolor;
  Function function;

  Social({this.color, this.image, this.imagecolor, this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
      child: TextButton(
        onPressed: function,
        child: Image.asset(
          image,
          width: 20,
          height: 20,
          color: imagecolor,
        ),
      ),
    );
  }
}
