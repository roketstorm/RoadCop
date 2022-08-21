import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:roadcop/game.dart';
import 'package:roadcop/screens/game_over_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: GameWidget(
            game: IntroScreenplay(),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => GameWidget(
                    game: RoadCopGame(),
                    overlayBuilderMap: {
                      'GameOverScreen': (ctx, RoadCopGame game) =>
                          GameOverScreen(
                            game: game,
                          ),
                    },
                  ),
                ));
          },
          child: const Text(
            'Skip >>',
            style: TextStyle(
              color: Color.fromRGBO(0, 200, 0, 1.0),
              fontFamily: 'Pointless',
              fontSize: 24,
              shadows: [Shadow(offset: Offset(5, 5), blurRadius: 0.0)],
            ),
          ),
        ),
      ],
    );
  }
}

class IntroScreenplay extends FlameGame {
  @override
  Future<void> onLoad() async {
    add(MyTextBox(
      'Year 2055. Neo-Miami. '
      'Roads become dangerous place. Local police department decided '
      'to make special forces to prevent attacks inside the city. '
      "Save your city by using heavily equipped RC-vehicle. "
      'Good luck!',
    )
      ..anchor = Anchor.topLeft
      ..position = Vector2(0, 0));
  }
}

const _regularTextStyle = TextStyle(
  fontSize: 16,
  color: Color.fromRGBO(0, 200, 0, 1.0),
  fontFamily: 'Pointless',
);
final _regular = TextPaint(style: _regularTextStyle);

class MyTextBox extends TextBoxComponent {
  MyTextBox(
    String text, {
    super.align,
    super.size,
    double? timePerChar,
    double? margins,
  }) : super(
          text: text,
          textRenderer: _regular,
          boxConfig: TextBoxConfig(
            maxWidth: 390,
            timePerChar: timePerChar ?? 0.05,
            growingBox: true,
            margins: EdgeInsets.all(margins ?? 8),
          ),
        );
}
