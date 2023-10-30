import 'package:flutter/material.dart';

import '../constraint/color_style.dart';
import '../constraint/text_style.dart';

class ButtonPlay extends StatelessWidget {
  final Function() playFunction;

  ButtonPlay({
    required this.playFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      child: Opacity(
        opacity: 0.9,
        child: Container(
          height: 38,
          width: 108,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: color2,
            ),
            onPressed: playFunction,
            child: Text(
              "Play",
              style: textSemibold.copyWith(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}