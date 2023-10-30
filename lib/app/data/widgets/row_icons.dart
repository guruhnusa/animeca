import 'package:flutter/material.dart';

import '../constraint/text_style.dart';

class RowIcons extends StatelessWidget {

  String text;
  String icons;

  RowIcons({
    required this.text,
    required this.icons,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 22,
          width: 22,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      "assets/icons/${icons}"))),
        ),
        SizedBox(height: 5,),
        Text(text,style: textRegular.copyWith(fontSize: 14,color: Colors.white),)
      ],
    );
  }
}