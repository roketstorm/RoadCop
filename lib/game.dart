import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roadcop/player.dart';

class RoadCopGame extends FlameGame with KeyboardEvents, HasTappables {
  late final Player player;

  // Player settings
  final Vector2 velocity = Vector2(0, 0);
  static const int speed = 200;

  @override
  Future<void>? onLoad() async {
    // Set scrolling background
    ParallaxComponent road = await ParallaxComponent.load(
      [
        ParallaxImageData('road.png'),
        ParallaxImageData('roadblock.png'),
      ],
      fill: LayerFill.width,
      repeat: ImageRepeat.repeat,
      baseVelocity: Vector2(0, -200),
    );
    add(road);

    // Initialize player
    player = Player(
      position: size / 1.4,
    );
    add(player);

    ButtonComponent leftButton = ButtonComponent(
      button: SpriteComponent(
        sprite: await Sprite.load('arrow_left.png'),
      ),
      onPressed: () => velocity.x = -1,
      onReleased: () => velocity.x = 0,
      position: Vector2(20, size.y / 1.2),
    );
    ButtonComponent rightButton = ButtonComponent(
      button: SpriteComponent(
        sprite: await Sprite.load('arrow_right.png'),
      ),
      onPressed: () => velocity.x = 1,
      onReleased: () => velocity.x = 0,
      position: Vector2(100, size.y / 1.2),
    );
    add(leftButton);
    add(rightButton);
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Draw movement
    final displacement = velocity * (speed * dt);
    player.position.add(displacement);
  }

  // Check keyboard events
  @override
  KeyEventResult onKeyEvent(
    RawKeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    final isKeyDown = event is RawKeyDownEvent;

    if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
      velocity.x = isKeyDown ? -1 : 0;
    } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
      velocity.x = isKeyDown ? 1 : 0;
    }

    return super.onKeyEvent(event, keysPressed);
  }
}
