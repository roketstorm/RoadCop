import 'package:flutter/material.dart';
import 'package:roadcop/game.dart';

class GameOverScreen extends StatelessWidget {
  final RoadCopGame game;

  const GameOverScreen({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Game Over',
            style: TextStyle(
              color: Color.fromRGBO(0, 200, 0, 1.0),
              fontFamily: 'Arcade',
              decoration: TextDecoration.none,
              fontSize: 50,
              shadows: [Shadow(offset: Offset(5, 5), blurRadius: 0.0)],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Score: ${game.score}',
            style: const TextStyle(
              color: Color.fromRGBO(0, 200, 0, 1.0),
              fontFamily: 'Pointless',
              fontSize: 24,
              decoration: TextDecoration.none,
              shadows: [Shadow(offset: Offset(5, 5), blurRadius: 0.0)],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 32,
          ),
          TextButton(
            onPressed: game.resetGame,
            child: const Text(
              'Retry',
              style: TextStyle(
                color: Color.fromRGBO(0, 200, 0, 1.0),
                fontFamily: 'Pointless',
                fontSize: 32,
                shadows: [Shadow(offset: Offset(5, 5), blurRadius: 0.0)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
