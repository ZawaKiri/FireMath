import 'dart:math';

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Bonusball extends StatelessWidget {
  final String text;
  final int bonus;

  Bonusball({required this.text, required this.bonus});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.width / 7) * (1 + 704 / 526),
      width: MediaQuery.of(context).size.width / 7,
      color: Colors.transparent,
      child: Center(
          child: Column(
        children: [
          Container(
            height: (MediaQuery.of(context).size.width / 7) * (704 / 526),
            width: MediaQuery.of(context).size.width / 7,
            child: Stack(children: [
              Center(
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(bonus * pi / 90),
                  child: Image.asset("assets/images/horloge.png",
                      width: MediaQuery.of(context).size.width / 7),
                ),
              ),
              Center(
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(bonus * pi / 90),
                  child: Center(
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationZ(bonus * pi / 45),
                      child: Image.asset("assets/images/aiguillage.png",
                          width: MediaQuery.of(context).size.width / 7),
                    ),
                  )
                ),
              )
            ]),
          ),
          Container(
            height: MediaQuery.of(context).size.width / 7,
            width: MediaQuery.of(context).size.width / 7,
            child: Center(
              child: AutoSizeText(
                text,
                style: TextStyle(fontSize: MediaQuery.of(context).size.height),
                textAlign: TextAlign.center,
                maxLines: text.length <= 5 ? 1 : 5,
                minFontSize: 1.0,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
