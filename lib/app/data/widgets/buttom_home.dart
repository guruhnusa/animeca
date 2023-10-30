import 'package:flutter/material.dart';

import '../constraint/text_style.dart';

class buttonHome extends StatelessWidget {
  String image;
  String text;
  double bottom ;
  double left;
  double right;

  buttonHome({
    required this.image,
    required this.text,
    required this.bottom,
    required this.left,
    required this.right,

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      left: left,
      right: right,
      child: Column(
        children: [
          Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image))),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            text,
            style: textMedium.copyWith(
                fontSize: 14, color: Colors.white),
          )
        ],
      ),
    );
  }
}
