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
        "Le but du jeu est de r??soudre les calculs qui d??filent ?? l'??cran afin de prot??ger l'andro??de et les maisons.",
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
                              " fait des d??g??ts en atteignant le bas de l'??cran.")
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
                          text: "L'andro??de",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              " est ?? prot??ger en priorit??, une flamme tombe dessus, et un malus de vitesse est enclench??. Deux flammes, et la partie est termin??e."),
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
                              " est la deuxi??me barri??re contre les flammes, elle peut r??sister ?? 2 impacts de flammes, mais le 3e sera mortel."),
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
                              " termine directement la partie en atteignant une maison. Elle appara??t automatiquement au dessus d'une maison en feu."),
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
                              " acc??l??rera la vitesse des autres flammes si elle atteint une maison."),
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
                              " ??change al??atoirement les calculs des diff??rentes flammes ?? l'??cran."),
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
      // description: "Voici les bonus pr??sents dans le jeu.\n\n\n"
      //     "Le bonus de temps permet de stopper la descente des boules de feu et les fait remonter pendant 2 secondes.\n\n"
      //     "Le bonus de l'eau permet de r??soudre tous les calculs pr??sents ?? l'??cran en une seule fois.\n\n"
      //     "Le bonus de soin permet de r??parer les d??g??ts caus??s aux maisons et ?? l'andro??de.\n",
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
                              " permet de r??soudre tous les calculs pr??sents ?? l'??cran en une seule fois."),
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
                              " permet de r??parer les d??g??ts caus??s aux maisons et ?? l'andro??de."),
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
        "Tutoriel interactif/imag?? en cours de d??veloppement",
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
