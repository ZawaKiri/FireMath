import 'package:auto_size_text/auto_size_text.dart';
import 'package:intro_slider/intro_slider.dart';

import 'package:flutter/material.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:tuxmath/homepage.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List<Slide> slides = [
    Slide(
      widgetTitle: Center(
        child: Text(
          "FireMath",
          style: TextStyle(
            color: Color(0xFFBCB6FF),
            fontSize: MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                    .size
                    .height /
                18,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(0, -4),
                blurRadius: 0,
                color: Color(0xFF002884),
              ),
            ],
          ),
        ),
      ),
      description:
          "Bienvenue dans FireMath, une application de calcul mental pas comme les autres.",
      pathImage: "assets/images/fire.png",
      backgroundColor: Color(0xFF3F51B5),
    ),
    Slide(
      widgetTitle: Center(
        child: Text(
          "Les Bonus",
          style: TextStyle(
            color: Color(0xFFBCB6FF),
            fontSize: MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                    .size
                    .height /
                18,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(0, -4),
                blurRadius: 0,
                color: Color(0xFF002884),
              ),
            ],
          ),
        ),
      ),
      // description: "Voici les bonus présents dans le jeu.\n\n\n"
      //     "Le bonus de temps permet de stopper la descente des boules de feu et les fait remonter pendant 2 secondes.\n\n"
      //     "Le bonus de l'eau permet de résoudre tous les calculs présents à l'écran en une seule fois.\n\n"
      //     "Le bonus de soin permet de réparer les dégâts causés aux maisons et à l'android.\n",
      centerWidget: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(children: [
            Image.asset("assets/images/horloge avec aiguille.png",
                width:
                    MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                            .size
                            .width /
                        4),
            AutoSizeText(
                "Le bonus de temps permet de stopper la descente des boules de feu et les fait remonter pendant 2 secondes."),
          ]),
          Row(children: [
            Image.asset("assets/images/water.png",
                width:
                    MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                            .size
                            .width /
                        4),
            AutoSizeText(
                "Le bonus de l'eau permet de résoudre tous les calculs présents à l'écran en une seule fois."),
          ]),
          Row(children: [
            Image.asset("assets/images/soins.png",
                width:
                    MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                            .size
                            .width /
                        4),
            AutoSizeText(
                "Le bonus de soin permet de réparer les dégâts causés aux maisons et à l'android."),
          ])
        ],
      ),
      backgroundColor: Color(0xFF00A878),
    ),
    Slide(
        title: "Comment Jouer",
        description: "Dans ce jeu, il faut résoudre les calculs ",
        backgroundImage: "assets/images/backimg.jpg",
        backgroundImageFit: BoxFit.contain,
        backgroundOpacity: 0.2
        //backgroundColor: Color(0xff203152),
        ),
  ];

  void onDonePress() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
    print("End of slides");
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
      onSkipPress: this.onDonePress,
    );
  }
}
