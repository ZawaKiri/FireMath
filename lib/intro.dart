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
      widgetDescription: Text(
        "Bienvenue dans FireMath, une application de calcul mental pas comme les autres.",
        style: TextStyle(
            fontSize: MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                    .size
                    .height /
                32),
        textAlign: TextAlign.center,
      ),
      pathImage: "assets/images/fire.png",
      backgroundColor: Color(0xFF3F51B5),
    ),
    Slide(
      widgetTitle: Center(
        child: Text(
          "Les Calculs",
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
      centerWidget: Container(
        height: (MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                    .size
                    .width /
                3) *
            (1 + 704 / 526),
        width: MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                .size
                .width /
            3,
        color: Colors.transparent,
        child: Center(
            child: Column(
          children: [
            Image.asset(
              "assets/images/fire.png",
              width: MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                      .size
                      .width /
                  3,
              //color: Color(0x22DB222A),
            ),
            Container(
              height: MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                      .size
                      .width /
                  3,
              width: MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                      .size
                      .width /
                  3,
              child: Center(
                child: AutoSizeText(
                  "4+3",
                  style: TextStyle(
                      fontSize: MediaQueryData.fromWindow(
                              WidgetsBinding.instance!.window)
                          .size
                          .height,
                      color: Color(0xFF0A0F32)),
                  textAlign: TextAlign.center,
                  minFontSize: 1.0,
                  wrapWords: false,
                ),
              ),
            ),
          ],
        )),
      ),
      widgetDescription: Text(
        "Le but du jeu est de résoudre les calculs qui défilent à l'écran afin de protéger l'androïde et les maisons.",
        style: TextStyle(
            fontSize: MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                    .size
                    .height /
                32),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Color(0xFF3F51B5),
    ),
    Slide(
      widgetTitle: Center(
        child: Text(
          "Les Bases",
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
      centerWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/fire.png",
                  width:
                      MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                              .size
                              .width /
                          4),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: "La flamme",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              " fait des dégâts en atteignant le bas de l'écran.")
                    ]),
                    style: TextStyle(
                        fontSize: MediaQueryData.fromWindow(
                                    WidgetsBinding.instance!.window)
                                .size
                                .height /
                            32),
                    textAlign: TextAlign.left),
              ),
            ),
          ]),
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/androidheart.png",
                  width:
                      MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                              .size
                              .width /
                          4),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: "L'androïde",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              " est à protéger en priorité, une flamme tombe dessus, et un malus de vitesse est enclenché. Deux flammes, et la partie est terminée."),
                    ]),
                    style: TextStyle(
                        fontSize: MediaQueryData.fromWindow(
                                    WidgetsBinding.instance!.window)
                                .size
                                .height /
                            32),
                    textAlign: TextAlign.left),
              ),
            ),
          ]),
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/house.png",
                  width:
                      MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                              .size
                              .width /
                          4),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: "La maison",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              " est la deuxième barrière contre les flammes, elle peut résister à 2 impacts de flammes, mais le 3e sera mortel."),
                    ]),
                    style: TextStyle(
                        fontSize: MediaQueryData.fromWindow(
                                    WidgetsBinding.instance!.window)
                                .size
                                .height /
                            32),
                    textAlign: TextAlign.left),
              ),
            ),
          ])
        ],
      ),
      backgroundColor: Color(0xFF3F51B5),
    ),
    Slide(
      widgetTitle: Center(
        child: Text(
          "Les Flammes",
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
      centerWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/bluefire.png",
                  width:
                      MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                              .size
                              .width /
                          4),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: "La flamme bleue",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              " termine directement la partie en atteignant une maison. Elle apparaît automatiquement au dessus d'une maison en feu."),
                    ]),
                    style: TextStyle(
                        fontSize: MediaQueryData.fromWindow(
                                    WidgetsBinding.instance!.window)
                                .size
                                .height /
                            32),
                    textAlign: TextAlign.left),
              ),
            ),
          ]),
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/img.png",
                  width:
                      MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                              .size
                              .width /
                          4),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: "La flamme virus",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              " accélérera la vitesse des autres flammes si elle atteint une maison."),
                    ]),
                    style: TextStyle(
                        fontSize: MediaQueryData.fromWindow(
                                    WidgetsBinding.instance!.window)
                                .size
                                .height /
                            32),
                    textAlign: TextAlign.left),
              ),
            ),
          ]),
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/firerecycle.png",
                  width:
                      MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                              .size
                              .width /
                          4),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: "La flamme changeante",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              " échange aléatoirement les calculs des différentes flammes à l'écran."),
                    ]),
                    style: TextStyle(
                        fontSize: MediaQueryData.fromWindow(
                                    WidgetsBinding.instance!.window)
                                .size
                                .height /
                            32),
                    textAlign: TextAlign.left),
              ),
            ),
          ])
        ],
      ),
      backgroundColor: Color(0xFFDB222A),
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
      //     "Le bonus de soin permet de réparer les dégâts causés aux maisons et à l'androïde.\n",
      centerWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/horloge avec aiguille.png",
                  width:
                      MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                              .size
                              .width /
                          4),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: "Le bonus de temps",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              " permet de stopper la descente des boules de feu et les fait remonter pendant 2 secondes."),
                    ]),
                    style: TextStyle(
                        fontSize: MediaQueryData.fromWindow(
                                    WidgetsBinding.instance!.window)
                                .size
                                .height /
                            32),
                    textAlign: TextAlign.left),
              ),
            ),
          ]),
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/water.png",
                  width:
                      MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                              .size
                              .width /
                          4),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: "Le bonus de l'eau",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              " permet de résoudre tous les calculs présents à l'écran en une seule fois."),
                    ]),
                    style: TextStyle(
                        fontSize: MediaQueryData.fromWindow(
                                    WidgetsBinding.instance!.window)
                                .size
                                .height /
                            32),
                    textAlign: TextAlign.left),
              ),
            ),
          ]),
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/soins.png",
                  width:
                      MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                              .size
                              .width /
                          4),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: "Le bonus de soin",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              " permet de réparer les dégâts causés aux maisons et à l'androïde."),
                    ]),
                    style: TextStyle(
                        fontSize: MediaQueryData.fromWindow(
                                    WidgetsBinding.instance!.window)
                                .size
                                .height /
                            32),
                    textAlign: TextAlign.left),
              ),
            ),
          ])
        ],
      ),
      backgroundColor: Color(0xFF00A878),
    ),
    Slide(
      widgetTitle: Text(
        "Comment Jouer",
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
        textAlign: TextAlign.center,
      ),
      widgetDescription: Text(
        "Tutoriel interactif/imagé en cours de développement",
        style: TextStyle(
            fontSize: MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                    .size
                    .height /
                32,
            color: Colors.white),
        textAlign: TextAlign.center,
      ),
      backgroundImage: "assets/images/backimg.jpg",
      backgroundImageFit: BoxFit.contain,
      backgroundOpacity: 0.2,
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
      renderDoneBtn: Text(
        "OK!",
        style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.height / 48),
      ),
      renderSkipBtn: Text(
        "Passer",
        maxLines: 2,
        style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.height / 48),
      ),
      renderNextBtn: Text(
        "Suivant",
        style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.height / 48),
      ),
    );
  }
}
