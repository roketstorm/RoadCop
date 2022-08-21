import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:roadcop/screens/main_menu_screen.dart';

void main() {
  // Game view settings
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();

  // Game launch
  // final game = RoadCopGame();
  // runApp(GameWidget(
  //   game: game,
  //   overlayBuilderMap: {
  //     'GameOverScreen': (ctx, RoadCopGame game) => GameOverScreen(
  //           game: game,
  //         ),
  //   },
  // ));

  runApp(MaterialApp(
    home: const MainMenuScreen(),
    theme: ThemeData(
      backgroundColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
    ),
  ));
}
