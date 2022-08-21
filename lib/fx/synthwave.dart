import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';

class Synthwave extends FlameGame {
  @override
  Future<void>? onLoad() async {
    ParallaxComponent back = await ParallaxComponent.load(
      [
        ParallaxImageData('menu_back.png'),
      ],
      fill: LayerFill.width,
      repeat: ImageRepeat.repeat,
      baseVelocity: Vector2(0, 0),
    );

    ParallaxComponent scroll = await ParallaxComponent.load(
      [
        ParallaxImageData('menu_scroll.png'),
      ],
      fill: LayerFill.width,
      repeat: ImageRepeat.repeat,
      baseVelocity: Vector2(0, -30),
    );

    add(scroll);
    add(back);
  }
}
