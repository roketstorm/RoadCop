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
        children: [
          const Text('Game Over'),
          TextButton(
            onPressed: game.resetGame,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
