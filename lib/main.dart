import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:roadcop/game.dart';

void main() {
  final game = RoadCopGame();
  runApp(GameWidget(game: game));
}
