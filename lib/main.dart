import 'package:flame/flame.dart';
import 'package:flame_splash_screen/flame_splash_screen.dart';
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
    // home: const MainMenuScreen(),
    home: FlameSplashScreen(
      theme: FlameSplashTheme(
        backgroundDecoration: const BoxDecoration(color: Color(0xFF000000)),
        logoBuilder: (context) =>
            LayoutBuilder(builder: (context, constraints) {
          return FractionalTranslation(
            translation: const Offset(0, -0.25),
            child: ConstrainedBox(
              constraints: BoxConstraints.loose(const Size(300, 300)),
              child: Image.asset('assets/images/flame_logo_green.png'),
            ),
          );
        }),
      ),
      showAfter: (context) => const Text(
        'RoketStorm',
        style: TextStyle(
          fontFamily: 'Nero',
          color: Color.fromRGBO(0, 200, 0, 1.0),
          fontSize: 42,
        ),
      ),
      onFinish: (context) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainMenuScreen(),
        ),
      ),
    ),
    theme: ThemeData(
      backgroundColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
    ),
  ));
}
