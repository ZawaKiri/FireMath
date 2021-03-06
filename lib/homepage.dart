import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuxmath/bonusball.dart';
import 'package:tuxmath/fireball.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    super.initState();
    anim =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    anim.forward();
    restore();
  }

  @override
  void dispose() {
    super.dispose();
    anim.dispose();
    Navigator.pop(context);
  }

  late AnimationController anim;
  var bonusWatch = new Stopwatch();
  var bonusD = 3;
  var malusWatch = new Stopwatch();
  var malusD = 5;
  var help = false;
  var score = 0;
  var scoreTotal = 0;
  var iscore = 0;
  var number = 0;
  var level = 1;
  var levels = [
    'Très facile',
    'Facile',
    'Moyen',
    'Intermédiaire',
    'Difficile',
    'Très difficile'
  ];
  var modes = ['+'];
  Map highs = {'+': 10};
  var position = [
    (MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.height *
                4 /
                5) *
            4 /
            5 -
        MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.height /
            18 -
        (MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width /
                7) *
            (704 / 526),
    -1.0,
    ((MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.height *
                    4 /
                    5) *
                4 /
                5 -
            MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                    .size
                    .height /
                18 -
            (MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                        .size
                        .width /
                    7) *
                (704 / 526)) /
        2,
    -1.0,
    (MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.height *
                4 /
                5) *
            4 /
            5 -
        MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.height /
            18 -
        (MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width /
                7) *
            (704 / 526)
  ];

  var speed = [5.0, 5.0, 5.0, 5.0, 5.0];
  var gameStarted = false;
  var texte = ['', 'Niveau : Très facile', 'Jouer', 'Mode Aventure', ''];
  var random = Random();
  var qT = [0, 0, 0, 0, 0];
  var loser = false;
  var winner = false;
  Timer _timer = Timer(Duration(milliseconds: 0), () {});
  var faux = 0.5;
  var vrai = 0.5;
  var bon = false;
  bool b = false;
  var mortel = [0, 0, 0, 0, 0];
  var sped = 1;
  var closed = false;
  var houseimg = 0;
  var houseimage = "assets/images/housefire.png";
  var hi = false;
  var textes = "";
  var isPlaying = false;
  var bPosition = [
    -(MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width /
            7) *
        (1 + 704 / 526),
    -(MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width /
            7) *
        (1 + 704 / 526),
    -(MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width /
            7) *
        (1 + 704 / 526),
    -(MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width /
            7) *
        (1 + 704 / 526),
    -(MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width /
            7) *
        (1 + 704 / 526)
  ];
  var bText = ['', '', '', '', ''];
  var bClock = 0;
  var bType = 0;
  var bF = 5;
  var debloque = 1;
  var vDebloque = [1, 1, 1, 1, 1, 1];
  var game = 'Aventure';
  var games = ['Aventure', 'Infini', 'Vitesse'];
  var cligno = false;
  var c = 0;

  void resetGame() {
    anim.forward();
    isPlaying = true;

    setState(() {
      help = false;
      number = 0;
      position = [
        (MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                        .size
                        .height *
                    4 /
                    5) *
                4 /
                5 -
            MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                    .size
                    .height /
                18 -
            10 * score -
            (MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                        .size
                        .width /
                    7) *
                (704 / 526),
        -1.0,
        ((MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                            .size
                            .height *
                        4 /
                        5) *
                    4 /
                    5 -
                MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                        .size
                        .height /
                    18 -
                10 * score -
                (MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                            .size
                            .width /
                        7) *
                    (704 / 526)) /
            2,
        -1.0,
        (MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                        .size
                        .height *
                    4 /
                    5) *
                4 /
                5 -
            MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                    .size
                    .height /
                18 -
            10 * score -
            (MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                        .size
                        .width /
                    7) *
                (704 / 526)
      ];

      speed = [5.0, 5.0, 5.0, 5.0, 5.0];
      gameStarted = false;
      texte = ['', 'Niveau : ${levels[level - 1]}', 'Jouer', 'Mode $game', ''];
      random = Random();
      qT = [0, 0, 0, 0, 0];
      score = 0;
      iscore = 0;
      loser = false;
      winner = false;
      _timer = Timer(Duration(milliseconds: 0), () {});
      faux = 0.5;
      vrai = 0.5;
      bon = false;
      b = false;
      mortel = [0, 0, 0, 0, 0];
      malusWatch.stop();
      malusWatch.reset();
      bonusWatch.stop();
      bonusWatch.reset();
      hi = false;
    });
  }

  void bTryNumber(int n, String s, int c) {
    var temp = [0.0, 0.0, 0.0, 0.0, 0.0];
    var v = '';
    for (var k in modes) if (s.split(k).length == 2) v = k;
    switch (v) {
      case '+':
        if ((n == int.parse(s.split("+")[0]) + int.parse(s.split("+")[1])) &&
            !bonusWatch.isRunning) {
          setState(() {
            bPosition[c] =
                -(MediaQuery.of(context).size.width / 7) * (1 + 704 / 526);
            if (bType < 4) {
              temp = [...speed];
              for (int k = 0; k < 5; k++) speed[k] *= -2;
              bonusWatch.start();
              bonusD = 2;
              Timer(Duration(seconds: bonusD), () {
                speed = [...temp];
                bonusWatch.stop();
                bonusWatch.reset();
                bonusD = 3;
                bon = false;
              });
            } else if (bType < 5) {
              for (int f = 0; f < 5; f++) {
                setState(() {
                  position[f] = -(MediaQuery.of(context).size.width / 7) *
                          (1 + 704 / 526) -
                      random.nextInt(((MediaQuery.of(context).size.width / 7) *
                              (1 + 704 / 526))
                          .toInt());
                  game == 'Aventure' ? score++ : iscore++;
                  speed[f] = (random.nextInt(3) + sped) / 2;
                  texte[f] = maths(modes[random.nextInt(modes.length)]);
                  mortel[f] = f == 2
                      ? 0
                      : qT[f] == 2
                          ? 1
                          : random.nextInt(10) == 0
                              ? 1
                              : random.nextInt(5) == 0
                                  ? random.nextInt(2) + 2
                                  : 0;
                });
              }
            } else if (bType < 7) {
              for (int f = 0; f < 5; f++) {
                setState(() {
                  if (qT[f] > 0) qT[f] -= 1;
                });
              }
            } else if (bType < 8) {
              for (int f = 0; f < 5; f++) {
                setState(() {});
              }
            }
          });
        }
        break;
      case '-':
        if ((n == int.parse(s.split("-")[0]) + int.parse(s.split("-")[1])) &&
            !bonusWatch.isRunning) {
          setState(() {
            bPosition[c] =
                -(MediaQuery.of(context).size.width / 7) * (1 + 704 / 526);
            if (bType < 4) {
              temp = [...speed];
              for (int k = 0; k < 5; k++) speed[k] *= -2;
              bonusWatch.start();
              bonusD = 2;
              Timer(Duration(seconds: bonusD), () {
                speed = [...temp];
                bonusWatch.stop();
                bonusWatch.reset();
                bonusD = 3;
                bon = false;
              });
            } else if (bType < 5) {
              for (int f = 0; f < 5; f++) {
                setState(() {
                  position[f] = -(MediaQuery.of(context).size.width / 7) *
                          (1 + 704 / 526) -
                      random.nextInt(((MediaQuery.of(context).size.width / 7) *
                              (1 + 704 / 526))
                          .toInt());
                  game == 'Aventure' ? score++ : iscore++;
                  speed[f] = (random.nextInt(3) + sped) / 2;
                  texte[f] = maths(modes[random.nextInt(modes.length)]);
                  mortel[f] = f == 2
                      ? 0
                      : qT[f] == 2
                          ? 1
                          : random.nextInt(10) == 0
                              ? 1
                              : random.nextInt(5) == 0
                                  ? random.nextInt(2) + 2
                                  : 0;
                });
              }
            } else if (bType < 7) {
              for (int f = 0; f < 5; f++) {
                setState(() {
                  if (qT[f] > 0) qT[f] -= 1;
                });
              }
            } else if (bType < 8) {
              for (int f = 0; f < 5; f++) {
                setState(() {});
              }
            }
          });
        }
        break;
      case '*':
        if ((n == int.parse(s.split("*")[0]) + int.parse(s.split("*")[1])) &&
            !bonusWatch.isRunning) {
          setState(() {
            bPosition[c] =
                -(MediaQuery.of(context).size.width / 7) * (1 + 704 / 526);
            if (bType < 4) {
              temp = [...speed];
              for (int k = 0; k < 5; k++) speed[k] *= -2;
              bonusWatch.start();
              bonusD = 2;
              Timer(Duration(seconds: bonusD), () {
                speed = [...temp];
                bonusWatch.stop();
                bonusWatch.reset();
                bonusD = 3;
                bon = false;
              });
            } else if (bType < 5) {
              for (int f = 0; f < 5; f++) {
                setState(() {
                  position[f] = -(MediaQuery.of(context).size.width / 7) *
                          (1 + 704 / 526) -
                      random.nextInt(((MediaQuery.of(context).size.width / 7) *
                              (1 + 704 / 526))
                          .toInt());
                  game == 'Aventure' ? score++ : iscore++;
                  speed[f] = (random.nextInt(3) + sped) / 2;
                  texte[f] = maths(modes[random.nextInt(modes.length)]);
                  mortel[f] = f == 2
                      ? 0
                      : qT[f] == 2
                          ? 1
                          : random.nextInt(10) == 0
                              ? 1
                              : random.nextInt(5) == 0
                                  ? random.nextInt(2) + 2
                                  : 0;
                });
              }
            } else if (bType < 7) {
              for (int f = 0; f < 5; f++) {
                setState(() {
                  if (qT[f] > 0) qT[f] -= 1;
                });
              }
            } else if (bType < 8) {
              for (int f = 0; f < 5; f++) {
                setState(() {});
              }
            }
          });
        }
        break;
      case '/':
        if ((n == int.parse(s.split("/")[0]) + int.parse(s.split("/")[1])) &&
            !bonusWatch.isRunning) {
          setState(() {
            bPosition[c] =
                -(MediaQuery.of(context).size.width / 7) * (1 + 704 / 526);
            if (bType < 4) {
              temp = [...speed];
              for (int k = 0; k < 5; k++) speed[k] *= -2;
              bonusWatch.start();
              bonusD = 2;
              Timer(Duration(seconds: bonusD), () {
                speed = [...temp];
                bonusWatch.stop();
                bonusWatch.reset();
                bonusD = 3;
                bon = false;
              });
            } else if (bType < 5) {
              for (int f = 0; f < 5; f++) {
                setState(() {
                  position[f] = -(MediaQuery.of(context).size.width / 7) *
                          (1 + 704 / 526) -
                      random.nextInt(((MediaQuery.of(context).size.width / 7) *
                              (1 + 704 / 526))
                          .toInt());
                  game == 'Aventure' ? score++ : iscore++;
                  speed[f] = (random.nextInt(3) + sped) / 2;
                  texte[f] = maths(modes[random.nextInt(modes.length)]);
                  mortel[f] = f == 2
                      ? 0
                      : qT[f] == 2
                          ? 1
                          : random.nextInt(10) == 0
                              ? 1
                              : random.nextInt(5) == 0
                                  ? random.nextInt(2) + 2
                                  : 0;
                });
              }
            } else if (bType < 7) {
              for (int f = 0; f < 5; f++) {
                setState(() {
                  if (qT[f] > 0) qT[f] -= 1;
                });
              }
            } else if (bType < 8) {
              for (int f = 0; f < 5; f++) {
                setState(() {});
              }
            }
          });
        }
        break;
    }
  }

  bool tryNumber(int n, String s, int c) {
    var a = 0;
    var v = '';
    for (var k in modes) if (s.split(k).length == 2) v = k;
    switch (v) {
      case '+':
        if (n == int.parse(s.split("+")[0]) + int.parse(s.split("+")[1])) {
          setState(() {
            position[c] = -(MediaQuery.of(context).size.width / 7) *
                    (1 + 704 / 526) -
                random.nextInt(
                    ((MediaQuery.of(context).size.width / 7) * (1 + 704 / 526))
                        .toInt());
            game == 'Aventure' ? score++ : iscore++;
            speed[c] = (random.nextInt(3) + sped) / 2;
            texte[c] = maths(modes[random.nextInt(modes.length)]);
            mortel[c] = c == 2
                ? 0
                : qT[c] == 2
                    ? 1
                    : random.nextInt(10) == 0
                        ? 1
                        : random.nextInt(5) == 0
                            ? random.nextInt(2) + 2
                            : 0;
            a = 1;
          });
        }
        break;
      case '-':
        if (n == int.parse(s.split("-")[0]) - int.parse(s.split("-")[1])) {
          setState(() {
            position[c] = -(MediaQuery.of(context).size.width / 7) *
                    (1 + 704 / 526) -
                random.nextInt(
                    ((MediaQuery.of(context).size.width / 7) * (1 + 704 / 526))
                        .toInt());
            game == 'Aventure' ? score++ : iscore++;
            speed[c] = (random.nextInt(3) + sped) / 2;
            texte[c] = maths(modes[random.nextInt(modes.length)]);
            mortel[c] = c == 2
                ? 0
                : qT[c] == 2
                    ? 1
                    : random.nextInt(10) == 0
                        ? 1
                        : random.nextInt(5) == 0
                            ? random.nextInt(2) + 2
                            : 0;
            a = 1;
          });
        }
        break;
      case '*':
        if (n == int.parse(s.split("*")[0]) * int.parse(s.split("*")[1])) {
          setState(() {
            position[c] = -(MediaQuery.of(context).size.width / 7) *
                    (1 + 704 / 526) -
                random.nextInt(
                    ((MediaQuery.of(context).size.width / 7) * (1 + 704 / 526))
                        .toInt());
            game == 'Aventure' ? score++ : iscore++;
            speed[c] = (random.nextInt(3) + sped) / 2;
            texte[c] = maths(modes[random.nextInt(modes.length)]);
            mortel[c] = c == 2
                ? 0
                : qT[c] == 2
                    ? 1
                    : random.nextInt(10) == 0
                        ? 1
                        : random.nextInt(5) == 0
                            ? random.nextInt(2) + 2
                            : 0;
            a = 1;
          });
        }
        break;
      case '/':
        if (n == int.parse(s.split("/")[0]) ~/ int.parse(s.split("/")[1])) {
          setState(() {
            position[c] = -(MediaQuery.of(context).size.width / 7) *
                    (1 + 704 / 526) -
                random.nextInt(
                    ((MediaQuery.of(context).size.width / 7) * (1 + 704 / 526))
                        .toInt());
            game == 'Aventure' ? score++ : iscore++;
            speed[c] = (random.nextInt(3) + sped) / 2;
            texte[c] = maths(modes[random.nextInt(modes.length)]);
            mortel[c] = c == 2
                ? 0
                : qT[c] == 2
                    ? 1
                    : random.nextInt(10) == 0
                        ? 1
                        : random.nextInt(5) == 0
                            ? random.nextInt(2) + 2
                            : 0;
            a = 1;
          });
        }
        break;
    }
    return (a == 1) ? true : false;
  }

  void lost(int pos) {
    if (!loser) {
      setState(() {
        loser = true;
        scoreTotal += game == 'Aventure'
            ? score
            : game == 'Vitesse'
                ? (sped - 1) * 20 + iscore
                : iscore;
        _timer.cancel();
        position = [
          (MediaQuery.of(context).size.height * 4 / 5) * 4 / 5 -
              MediaQuery.of(context).size.height / 18 -
              (MediaQuery.of(context).size.height * 16 / 25) * score / 50 -
              (MediaQuery.of(context).size.width / 7) * (704 / 526),
          (MediaQuery.of(context).size.height * 4 / 5) * 4 / 5 -
              MediaQuery.of(context).size.height / 18 -
              (MediaQuery.of(context).size.height * 16 / 25) * score / 50 -
              (MediaQuery.of(context).size.width / 7) * (704 / 526),
          (MediaQuery.of(context).size.height * 4 / 5) * 4 / 5 -
              MediaQuery.of(context).size.height / 18 -
              (MediaQuery.of(context).size.height * 16 / 25) * score / 50 -
              (MediaQuery.of(context).size.width / 7) * (704 / 526),
          (MediaQuery.of(context).size.height * 4 / 5) * 4 / 5 -
              MediaQuery.of(context).size.height / 18 -
              (MediaQuery.of(context).size.height * 16 / 25) * score / 50 -
              (MediaQuery.of(context).size.width / 7) * (704 / 526),
          (MediaQuery.of(context).size.height * 4 / 5) * 4 / 5 -
              MediaQuery.of(context).size.height / 18 -
              (MediaQuery.of(context).size.height * 16 / 25) * score / 50 -
              (MediaQuery.of(context).size.width / 7) * (704 / 526)
        ];
        qT = [2, 2, 2, 2, 2];
      });
      showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => AlertDialog(
          title: ListTile(
            title: Center(
                child: Text(winner ? 'Gagné!' : 'Perdu!',
                    style: TextStyle(fontWeight: FontWeight.bold))),
            subtitle: Center(
                child: Text('Niveau : ${levels[level - 1]}, Vitesse : $sped',
                    style: TextStyle(fontWeight: FontWeight.bold))),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                  'Score : ${game == 'Aventure' ? score : game == 'Vitesse' ? (sped - 1) * 20 + iscore : iscore}${game == 'Aventure' ? "\nScore Total : $scoreTotal" : ''}\n',
                  textAlign: TextAlign.right),
              Center(
                heightFactor: 1,
                child: Text(
                    '${(sped == 3) && winner ? 'Niveau ${levels[level]} débloqué!' : ''}',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Text(
                '${game == 'Aventure' ? "Réalisez un score de 20 pour débloquer ${(winner ? (sped + 1) : sped) == 3 ? 'le niveau supérieur' : 'la vitesse supérieure'}\n"
                    "${(winner ? (sped + 1) : sped) == 3 ? 'et de 30 pour débloquer un niveau bonus\n' : ''}" : game == 'Infini' ? "Jouez au mode Vitesse pour débloquer plus de vitesses\nJouez au mode Aventure pour débloquer plus de Niveaux" : "La vitesse augmente tous les 20 points"}',
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          Navigator.pop(
                              context,
                              winner
                                  ? (sped + 1) == 3
                                      ? 'Niveau suivant'
                                      : 'Vitesse suivante'
                                  : 'Recommencer');
                          score = 0;
                          if (winner) {
                            sped += 1;
                            if (sped > 3) {
                              level += 1;
                              if (level > debloque) debloque = level;
                              nextLevel(level);
                            }
                          } else {
                            iscore = 0;
                            if (game == 'Vitesse') sped = 1;
                            scoreTotal = 0;
                          }
                          resetGame();
                          startGame();
                        });
                      },
                      child: Text(
                        winner
                            ? sped == 3
                                ? 'Niveau suivant'
                                : 'Vitesse suivante'
                            : 'Recommencer',
                        style: TextStyle(color: Color(0xFF0B0F21)),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Color(0xFF00A878)),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          Navigator.pop(context, 'Menu principal');
                          if (winner) {
                            sped += 1;
                            if (sped > 3) {
                              level += 1;
                              if (level > debloque) debloque = level;
                              nextLevel(level);
                            }
                          }
                          score = 0;
                          iscore = 0;
                          scoreTotal = 0;
                          nextLevel(1);
                          save();
                        });
                      },
                      child: const Text(
                        'Menu Principal',
                        style: TextStyle(color: Color(0xFF0A0F32)),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Color(0xFFDB222A)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
  }

  void nextLevel(int l) {
    switch (l) {
      case 1:
        modes = ['+'];
        highs = {'+': 10};
        break;
      case 2:
        modes = ['+', '-'];
        highs = {'+': 50, '-': 20};
        break;
      case 3:
        modes = ['+', '-', '*'];
        highs = {'+': 100, '-': 50, '*': 10};
        break;
      case 4:
        modes = ['+', '-', '*', '/'];
        highs = {'+': 200, '-': 100, '*': 12, '/': 5};
        break;
      case 5:
        modes = ['+', '-', '*', '/'];
        highs = {'+': 500, '-': 200, '*': 15, '/': 10};
        break;
      case 6:
        modes = ['+', '-', '*', '/'];
        highs = {'+': 1000, '-': 500, '*': 20, '/': 15};
        break;
    }
    sped = 1;
    resetGame();
  }

  void startGame() {
    anim.reverse();
    isPlaying = true;
    gameStarted = true;
    for (int f = 0; f < 5; f++) {
      position[f] = -(MediaQuery.of(context).size.width / 7) * (1 + 704 / 526) -
          random.nextInt(
              ((MediaQuery.of(context).size.width / 7) * (1 + 704 / 526))
                  .toInt());
      speed[f] = (random.nextInt(3) + sped) / 2;
      texte[f] = maths(modes[random.nextInt(modes.length)]);
      qT[f] = 0;
    }

    _timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      print(mortel);
      c = (c + 1) % 20;
      if (c == 0) cligno = !cligno;
      for (int f = 0; f < 5; f++) {
        setState(() {
          position[f] += speed[f] * (malusWatch.isRunning ? 2 : 1);
          if (!hi) {
            hi = true;
            houseimage = houseimg > 5
                ? "assets/images/housefire.png"
                : "assets/images/revertedhousefire.png";
            houseimg += 1;
            if (houseimg == 10) houseimg = 0;
          }
          if (bF == f) {
            if (bon && !bonusWatch.isRunning) {
              bPosition[f] += random.nextInt(3) + sped;
              bClock = bClock + 1 % 360;
              if (bPosition[f] >
                  (MediaQuery.of(context).size.height * 4 / 5) * 4 / 5 -
                      MediaQuery.of(context).size.height / 18 -
                      (MediaQuery.of(context).size.height * 16 / 25) *
                          score /
                          50 -
                      (MediaQuery.of(context).size.width / 7) * (704 / 526)) {}
            } else {
              bPosition[f] =
                  -(MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                              .size
                              .width /
                          7) *
                      (1 + 704 / 526);
              bText[f] = '';
              bF = 5;
            }
          }
        });
        if (score >= 20) {
          winner = true;
          if (score >= 40) lost(2);
        }
        if (iscore >= 20) {
          if (game == 'Vitesse') {
            iscore -= 20;
            sped += 1;
            if (sped > vDebloque[level - 1]) vDebloque[level - 1] = sped;
          }
        }
        if (position[f] >
            (MediaQuery.of(context).size.height * 4 / 5) * 4 / 5 -
                MediaQuery.of(context).size.height / 18 -
                (MediaQuery.of(context).size.height * 16 / 25) * score / 50 -
                (MediaQuery.of(context).size.width / 7) * (704 / 526)) {
          if (mortel[f] == 1 || (f == 2 && qT[f] == 1))
            lost(f);
          else {
            qT[f] += 1;
            if (f == 2 || mortel[f] == 3) {
              setState(() {
                malusWatch.start();
                Timer(Duration(seconds: malusD), () {
                  malusWatch.stop();
                  malusWatch.reset();
                });
              });
            } else if (mortel[f] == 2) {
              if (!malusWatch.isRunning) {
                print('letzego');
                setState(() {
                  for (int k = 1; k <= malusD; k++) {
                    Timer(Duration(milliseconds: k * malusD * 400), () {
                      texte.shuffle();
                    });
                  }
                });
              }
            }
            position[f] = -(MediaQuery.of(context).size.width / 7) *
                    (1 + 704 / 526) -
                random.nextInt(
                    ((MediaQuery.of(context).size.width / 7) * (1 + 704 / 526))
                        .toInt());
            speed[f] = (random.nextInt(3) + sped) / 2;
            texte[f] = maths(modes[random.nextInt(modes.length)]);
            mortel[c] = c == 2
                ? 0
                : qT[c] == 2
                    ? 1
                    : random.nextInt(10) == 0
                        ? 1
                        : random.nextInt(5) == 0
                            ? random.nextInt(2) + 2
                            : 0;
          }
        }
      }
      hi = false;
    });
  }

  String maths(String mode) {
    var a = random.nextInt(highs[mode] - 1) + 1;
    var b = random.nextInt(a) + 1;
    return mode == '/' ? '${a * b}$mode$b' : '$a$mode$b';
  }

  Future<void> saveMenu() async {
    var selected = await showMenu(
        context: context,
        elevation: 8.0,
        position: RelativeRect.fromLTRB(
            0, MediaQuery.of(context).size.height / 18, 0, 0),
        items: [
          PopupMenuItem(value: 0, child: Text('Sauvegarder')),
          PopupMenuItem(value: 1, child: Text('Restaurer'))
        ]);
    if (selected == 0) {
      save();
    } else if (selected == 1) {
      restore();
    }
    anim.forward();
    isPlaying = false;
  }

  Future<void> save() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt('Niveaux', debloque);
    prefs.setString('Vitesses', json.encode(vDebloque));

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Sauvegardé!"),
      duration: Duration(seconds: 2),
    ));
  }

  Future<void> restore() async {
    final prefs = await SharedPreferences.getInstance();
    debloque = prefs.getInt('Niveaux') ?? 0;
    vDebloque = json
        .decode(prefs.getString('Vitesses') ?? '[1, 1, 1, 1, 1, 1]')
        .cast<int>();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Restauré!"),
      duration: Duration(seconds: 2),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height / 18 +
            (MediaQuery.of(context).size.height * 16 / 25) * score / 50,
        leading: Center(
          child: IconButton(
            iconSize: MediaQuery.of(context).size.height / 24,
            icon: AnimatedIcon(
                icon: AnimatedIcons.home_menu,
                progress: anim,
                color: Color(0xFF0A0F32)),
            onPressed: () {
              setState(() {
                isPlaying ? anim.forward() : anim.reverse();
                isPlaying = !isPlaying;
                if (gameStarted) {
                  gameStarted = false;
                  _timer.cancel();
                  nextLevel(1);
                  save();
                } else {
                  if (isPlaying) {
                    saveMenu();
                  }
                }
              });
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                  "Score : ${game == 'Aventure' ? score : game == 'Vitesse' ? (sped - 1) * 20 + iscore : iscore}",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 32,
                      color: Color(0xFF0A0F32))),
            ),
          )
        ],
        title: Center(
          child: Text(
            "FireMath",
            style: TextStyle(
              color: Color(0xFFBCB6FF),
              fontSize: MediaQuery.of(context).size.height / 24,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(0, -4),
                  blurRadius: 0,
                  color: Color.fromARGB(255, 0, 0, 128),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Color(0xFF3F51B5),
      ),
      backgroundColor: Colors.indigo[300],
      body: Center(
        child: Column(
          children: [
            Expanded(
                child: Container(
              color: Colors.black,
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                color: Color(0xFF8B86CC),
                                child: Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      if (bF == 0 && bon)
                                        Positioned(
                                            top: bPosition[0],
                                            child: Bonusball(
                                                text: bText[0],
                                                bonus: bType,
                                                rot: bClock)),
                                      Positioned(
                                        top: position[0],
                                        child: Fireball(
                                            text: cligno ? texte[0] : "",
                                            mortel: mortel[0],
                                            fireimg: houseimg > 5),
                                      )
                                    ]),
                              ),
                            )
                          ],
                        )),
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  color: Color(0xFFBCB6FF),
                                  child: Stack(
                                      alignment: Alignment.topCenter,
                                      children: [
                                        if (bF == 1 && bon)
                                          Positioned(
                                              top: bPosition[1],
                                              child: Bonusball(
                                                  text: bText[1],
                                                  bonus: bType,
                                                  rot: bClock)),
                                        Positioned(
                                          top: position[1],
                                          child: !gameStarted
                                              ? TextButton(
                                                  onPressed: () {
                                                    if (!gameStarted) {
                                                      setState(() {
                                                        level =
                                                            level >= debloque
                                                                ? 1
                                                                : level + 1;
                                                        print(level);
                                                        texte[1] =
                                                            "Niveau : ${levels[level - 1]}";
                                                        nextLevel(level);
                                                      });
                                                    }
                                                  },
                                                  child: Fireball(
                                                      text: texte[1],
                                                      mortel: mortel[1],
                                                      fireimg: houseimg < 5),
                                                )
                                              : Fireball(
                                                  text: texte[1],
                                                  mortel: mortel[1],
                                                  fireimg: houseimg < 5),
                                        )
                                      ]),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  color: Color(0xFF8B86CC),
                                  child: Stack(
                                      alignment: Alignment.topCenter,
                                      children: [
                                        if (bF == 2 && bon)
                                          Positioned(
                                              top: bPosition[2],
                                              child: Bonusball(
                                                  text: bText[2],
                                                  bonus: bType,
                                                  rot: bClock)),
                                        Positioned(
                                          top: position[2],
                                          child: !gameStarted
                                              ? TextButton(
                                                  onPressed: () {
                                                    print(level);
                                                    if (!gameStarted) {
                                                      showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return StatefulBuilder(
                                                                builder: (context,
                                                                    setState) {
                                                              return AlertDialog(
                                                                title: Center(
                                                                    child: Text(
                                                                        "Vitesse $sped")),
                                                                content: Text(game ==
                                                                        'Aventure'
                                                                    ? "Score de 20 pour débloquer ${sped == 3 ? 'le niveau supérieur' : 'la vitesse supérieure'}\n"
                                                                        "${sped == 3 ? '30 pour débloquer le niveau bonus\n' : ''}"
                                                                    : game ==
                                                                            'Infini'
                                                                        ? "Jouez au mode Vitesse pour débloquer plus de vitesses\nJouez au mode Aventure pour débloquer plus de Niveaux"
                                                                        : "La vitesse augmente tous les 20 points"),
                                                                actions: [
                                                                  Row(
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              TextButton(
                                                                            onPressed:
                                                                                () {
                                                                              setState(() {
                                                                                Navigator.pop(context, 'Commencer');
                                                                                startGame();
                                                                              });
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              'Commencer',
                                                                              style: TextStyle(color: Color(0xFF0B0F21)),
                                                                            ),
                                                                            style:
                                                                                TextButton.styleFrom(backgroundColor: Color(0xFF00A878)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      if (game ==
                                                                          'Infini')
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8.0),
                                                                            child:
                                                                                TextButton(
                                                                              onPressed: () {
                                                                                setState(() {
                                                                                  sped = (sped == vDebloque[level - 1]) ? 1 : sped + 1;
                                                                                });
                                                                              },
                                                                              child: Text(
                                                                                'Vitesse ${sped == vDebloque[level - 1] ? 1 : sped + 1}',
                                                                                style: TextStyle(color: Color(0xFF0B0F21)),
                                                                              ),
                                                                              style: TextButton.styleFrom(backgroundColor: Color(0xFF00A878)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              TextButton(
                                                                            onPressed:
                                                                                () {
                                                                              setState(() {
                                                                                Navigator.pop(context, 'Retour');
                                                                                if (game == 'Infini') sped = 1;
                                                                              });
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              'Retour',
                                                                              style: TextStyle(color: Color(0xFF0B0F21)),
                                                                            ),
                                                                            style:
                                                                                TextButton.styleFrom(backgroundColor: Color(0xFFDB222A)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  )
                                                                ],
                                                              );
                                                            });
                                                          });
                                                    }
                                                  },
                                                  child: Fireball(
                                                      text: texte[2],
                                                      mortel: mortel[2],
                                                      fireimg: houseimg > 5),
                                                )
                                              : Fireball(
                                                  text: texte[2],
                                                  mortel: mortel[2],
                                                  fireimg: houseimg > 5),
                                        )
                                      ]),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  color: Color(0xFFBCB6FF),
                                  child: Stack(
                                      alignment: Alignment.topCenter,
                                      children: [
                                        if (bF == 3 && bon)
                                          Positioned(
                                              top: bPosition[3],
                                              child: Bonusball(
                                                  text: bText[3],
                                                  bonus: bType,
                                                  rot: bClock)),
                                        Positioned(
                                          top: position[3],
                                          child: !gameStarted
                                              ? TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      game = games[
                                                          (games.indexOf(game) +
                                                                  1) %
                                                              games.length];
                                                      texte[3] = 'Mode $game';
                                                    });
                                                  },
                                                  child: Fireball(
                                                      text: texte[3],
                                                      mortel: mortel[3],
                                                      fireimg: houseimg < 5),
                                                )
                                              : Fireball(
                                                  text: texte[3],
                                                  mortel: mortel[3],
                                                  fireimg: houseimg < 5),
                                        )
                                      ]),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  color: Color(0xFF8B86CC),
                                  child: Stack(
                                      alignment: Alignment.topCenter,
                                      children: [
                                        if (bF == 4 && bon)
                                          Positioned(
                                              top: bPosition[4],
                                              child: Bonusball(
                                                  text: bText[4],
                                                  bonus: bType,
                                                  rot: bClock)),
                                        Positioned(
                                          top: position[4],
                                          child: Fireball(
                                              text: texte[4],
                                              mortel: mortel[4],
                                              fireimg: houseimg > 5),
                                        )
                                      ]),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      height:
                          (MediaQuery.of(context).size.height * 4 / 5) * 1 / 5,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                                color: Color(0xFF3F51B5),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          child: Image.asset(
                                        (qT[0] == 0)
                                            ? "assets/images/house.png"
                                            : (qT[0] == 1)
                                                ? "assets/images/housebroken.png"
                                                : houseimage,
                                        height:
                                            MediaQuery.of(context).size.width /
                                                7,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                7,
                                      )),
                                      Expanded(
                                          child: Image.asset(
                                        (qT[1] == 0)
                                            ? "assets/images/house.png"
                                            : (qT[1] == 1)
                                                ? "assets/images/housebroken.png"
                                                : houseimage,
                                        height:
                                            MediaQuery.of(context).size.width /
                                                7,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                7,
                                      )),
                                      Expanded(
                                          child: Image.asset(
                                        (qT[2] == 0)
                                            ? "assets/images/androidheart.png"
                                            : (qT[2] == 1)
                                                ? "assets/images/androiddead.png"
                                                : "assets/images/androidfire.png",
                                        height:
                                            MediaQuery.of(context).size.width /
                                                7,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                7,
                                      )),
                                      Expanded(
                                          child: Image.asset(
                                        (qT[3] == 0)
                                            ? "assets/images/house.png"
                                            : (qT[3] == 1)
                                                ? "assets/images/housebroken.png"
                                                : houseimage,
                                        height:
                                            MediaQuery.of(context).size.width /
                                                7,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                7,
                                      )),
                                      Expanded(
                                          child: Image.asset(
                                        (qT[4] == 0)
                                            ? "assets/images/house.png"
                                            : (qT[4] == 1)
                                                ? "assets/images/housebroken.png"
                                                : houseimage,
                                        height:
                                            MediaQuery.of(context).size.width /
                                                7,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                7,
                                      ))
                                    ])),
                          ),
                          Container(
                            color: Color(0xFF3F51B5),
                            child: Row(
                              children: [
                                AnimatedOpacity(
                                    opacity: malusWatch.isRunning ? 1 : 0.5,
                                    duration: Duration(milliseconds: 200),
                                    child: Center(
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/images/faux.png",
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                20,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                20,
                                          ),
                                          if (malusWatch.isRunning)
                                            Text(
                                                '${malusD - malusWatch.elapsed.inSeconds}',
                                                style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            42)),
                                        ],
                                      ),
                                    )),
                                AnimatedOpacity(
                                  opacity: bonusWatch.isRunning ? 1 : 0.5,
                                  duration: Duration(milliseconds: 200),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/valide.png",
                                        height:
                                            MediaQuery.of(context).size.height /
                                                20,
                                        width:
                                            MediaQuery.of(context).size.height /
                                                20,
                                      ),
                                      if (bonusWatch.isRunning)
                                        Text(
                                            '${bonusD - bonusWatch.elapsed.inSeconds}',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    42)),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    color: Color(0xFF3F51B5),
                                    child: Center(
                                      child: Text(
                                        '$number',
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                30),
                                      ),
                                    ),
                                  ),
                                ),
                                AnimatedOpacity(
                                    opacity: faux,
                                    duration: Duration(milliseconds: 200),
                                    child: Image.asset(
                                      "assets/images/faux.png",
                                      height:
                                          MediaQuery.of(context).size.height /
                                              20,
                                      width:
                                          MediaQuery.of(context).size.height /
                                              20,
                                    )),
                                AnimatedOpacity(
                                    opacity: vrai,
                                    duration: Duration(milliseconds: 200),
                                    child: Image.asset(
                                      "assets/images/valide.png",
                                      height:
                                          MediaQuery.of(context).size.height /
                                              20,
                                      width:
                                          MediaQuery.of(context).size.height /
                                              20,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            )),
            Container(
                height: MediaQuery.of(context).size.height * 1 / 5,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      color: Colors.indigo[300],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: (Colors.indigo[500])!,
                                  offset: Offset(2, 2),
                                  blurRadius: 5,
                                  spreadRadius: 0.5,
                                ),
                                BoxShadow(
                                  color: (Colors.indigo[100])!,
                                  offset: Offset(-2, -2),
                                  blurRadius: 5,
                                  spreadRadius: 0.5,
                                )
                              ],
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  (Colors.indigo[100])!,
                                  (Colors.indigo[600])!
                                ],
                              ),
                            ),
                            //borderRadius: BorderRadius.circular(10)
                            child: Center(
                              child: TextButton(
                                onPressed: null,
                                child: Icon(
                                  help
                                      ? Icons.lightbulb
                                      : Icons.lightbulb_outline,
                                  color: Color(0xFFDB222A),
                                ),
                              ),
                            )),
                      ),
                    )),
                    Expanded(
                      flex: 5,
                      child: Container(
                        color: Colors.indigo[300],
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                    5,
                                    (index) => Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  (49 / 5),
                                              decoration: BoxDecoration(
                                                  color: (Colors.indigo[300])!,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color:
                                                          (Colors.indigo[500])!,
                                                      offset: Offset(2, 2),
                                                      blurRadius: 5,
                                                      spreadRadius: 0.5,
                                                    ),
                                                    BoxShadow(
                                                      color:
                                                          (Colors.indigo[100])!,
                                                      offset: Offset(-2, -2),
                                                      blurRadius: 5,
                                                      spreadRadius: 0.5,
                                                    )
                                                  ],
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                    colors: [
                                                      (Colors.indigo[200])!,
                                                      (Colors.indigo[400])!
                                                    ],
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Center(
                                                child: TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      number =
                                                          10 * number + index;
                                                    });
                                                  },
                                                  child: Text(
                                                    '$index',
                                                    style: TextStyle(
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            20,
                                                        color:
                                                            (Colors.red[500])!),
                                                  ),
                                                ),
                                              )),
                                        )),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                    5,
                                    (index) => Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  (49 / 5),
                                              decoration: BoxDecoration(
                                                  color: (Colors.indigo[300])!,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color:
                                                          (Colors.indigo[500])!,
                                                      offset: Offset(2, 2),
                                                      blurRadius: 5,
                                                      spreadRadius: 0.5,
                                                    ),
                                                    BoxShadow(
                                                      color:
                                                          (Colors.indigo[100])!,
                                                      offset: Offset(-2, -2),
                                                      blurRadius: 5,
                                                      spreadRadius: 0.5,
                                                    )
                                                  ],
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                    colors: [
                                                      (Colors.indigo[200])!,
                                                      (Colors.indigo[400])!
                                                    ],
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Center(
                                                child: TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      number = 10 * number +
                                                          index +
                                                          5;
                                                    });
                                                  },
                                                  child: Text(
                                                    '${index + 5}',
                                                    style: TextStyle(
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            20,
                                                        color:
                                                            (Colors.red[500])!),
                                                  ),
                                                ),
                                              )),
                                        )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      color: Colors.indigo[300],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.indigo[300],
                                boxShadow: [
                                  BoxShadow(
                                    color: (Colors.indigo[500])!,
                                    offset: Offset(2, 2),
                                    blurRadius: 5,
                                    spreadRadius: 0.5,
                                  ),
                                  BoxShadow(
                                    color: (Colors.indigo[100])!,
                                    offset: Offset(-2, -2),
                                    blurRadius: 5,
                                    spreadRadius: 0.5,
                                  )
                                ],
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    (Colors.indigo[100])!,
                                    (Colors.indigo[600])!
                                  ],
                                ),
                                shape: BoxShape.circle),
                            child: Center(
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    if (gameStarted == true) {
                                      b = false;
                                      if (bon)
                                        bTryNumber(number, bText[bF], bF);
                                      for (int f = 0; f < 5; f++)
                                        if (tryNumber(number, texte[f], f) ==
                                            true) {
                                          b = true;
                                          vrai = 1.0;
                                          if (!bon) {
                                            bon = random.nextInt(5) == 0;
                                            if (bon) {
                                              bF = random.nextInt(5);
                                              bText[bF] = maths(modes[random
                                                  .nextInt(modes.length)]);
                                              bType = random.nextInt(7);
                                            }
                                          }
                                          Timer(Duration(milliseconds: 300),
                                              () {
                                            vrai = 0.5;
                                          });
                                        }
                                      if (b == false) {
                                        faux = 1.0;
                                        Timer(Duration(milliseconds: 300), () {
                                          faux = 0.5;
                                          bon = false;
                                        });
                                      }
                                      number = 0;
                                    }
                                  });
                                },
                                child: Text(
                                  '=',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              20,
                                      color: (Colors.red[500])!),
                                ),
                              ),
                            )),
                      ),
                    )),
                  ],
                )
                /*Container(
                      color: Colors.indigo,
                      child: GridView.builder(
                        itemCount: liste.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.indigo,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextButton(
                                onPressed: null,
                                child: liste[index],
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.indigo,
                                  shadowColor: Colors.black,
                                ),
                              ),
                            ),
                          );
                        },
                      )*/
                )
          ],
        ),
      ),
    );
  }
}
