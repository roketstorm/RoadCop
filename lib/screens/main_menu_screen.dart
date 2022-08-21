import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:roadcop/fx/synthwave.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:roadcop/game.dart';
import 'package:roadcop/screens/game_over_screen.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Flexible(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  color: Color.fromRGBO(0, 200, 0, 1.0),
                  child: Image.asset(
                    'assets/images/sun.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  child: GameWidget(
                    game: Synthwave(),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(),
                const Text(
                  'RoadCop',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Arcade',
                    fontSize: 50,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GameWidget(
                                      game: RoadCopGame(),
                                      overlayBuilderMap: {
                                        'GameOverScreen':
                                            (ctx, RoadCopGame game) =>
                                                GameOverScreen(
                                                  game: game,
                                                ),
                                      },
                                    )));
                      },
                      child: const Text(
                        'Start',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 200, 0, 1.0),
                          fontFamily: 'Pointless',
                          fontSize: 32,
                          shadows: [
                            Shadow(offset: Offset(5, 5), blurRadius: 0.0)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'About',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 200, 0, 1.0),
                          fontFamily: 'Pointless',
                          fontSize: 32,
                          shadows: [
                            Shadow(offset: Offset(5, 5), blurRadius: 0.0)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text(
                    'Made by RoketStorm (c) 2022',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 200, 0, 1.0),
                      fontFamily: 'Pointless',
                      fontSize: 10,
                      shadows: [Shadow(offset: Offset(5, 5), blurRadius: 0.0)],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text(
                    'Powered by Flame Engine',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 200, 0, 1.0),
                      fontFamily: 'Pointless',
                      fontSize: 10,
                      shadows: [Shadow(offset: Offset(5, 5), blurRadius: 0.0)],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
