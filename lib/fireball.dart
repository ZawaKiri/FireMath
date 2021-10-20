import 'dart:math';

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Fireball extends StatelessWidget {
  final String text;
  final bool mortel;
  final bool fireimg;

  Fireball({required this.text, required this.mortel, required this.fireimg});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.width / 7) * (1 + 704/526),
      width: MediaQuery.of(context).size.width / 7,
      color: Colors.transparent,
      child: Center(
          child: Column(
        children: [
            Transform(alignment: Alignment.center, transform: Matrix4.rotationY(fireimg ? pi : 0),
            child: Image.asset(mortel ?
              "assets/images/bluefire.png" : "assets/images/fire.png",
              width: MediaQuery.of(context).size.width / 7,
              //color: Color(0x22DB222A),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.width / 7,
            width: MediaQuery.of(context).size.width / 7,
            child: Center(
              child: AutoSizeText(
                text,
                style: TextStyle(fontSize: MediaQuery.of(context).size.height, color: Color(0xFF0A0F32)),
                textAlign: TextAlign.center,
                maxLines: text.length <= 5 ? 1 : 3,
                minFontSize: 1.0,
                wrapWords: false,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
