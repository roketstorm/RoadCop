import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:roadcop/fx/synthwave.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
              Spacer(),
              const Text(
                'RoadCop',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Arcade',
                  fontSize: 50,
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              Column(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Start',
                      style: TextStyle(
                        color: Color.fromRGBO(0, 200, 0, 1.0),
                        fontFamily: 'Pointless',
                        fontSize: 32,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'About',
                      style: TextStyle(
                        color: Color.fromRGBO(0, 200, 0, 1.0),
                        fontFamily: 'Pointless',
                        fontSize: 32,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
