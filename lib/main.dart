import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:roadcop/game.dart';

void main() {
  // Game view settings
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();

  // Game launch
  final game = RoadCopGame();
  runApp(GameWidget(game: game));
}
