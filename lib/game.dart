import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roadcop/bullet.dart';
import 'package:roadcop/enemy_controller.dart';
import 'package:roadcop/player.dart';

class RoadCopGame extends FlameGame with KeyboardEvents, HasTappables {
  late final Player player;

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

    EnemyController enemyController = EnemyController();
    add(enemyController);

    ButtonComponent leftButton = ButtonComponent(
      button: SpriteComponent(
        sprite: await Sprite.load('arrow_left.png'),
      ),
      onPressed: () => player.setDirection(-1),
      onReleased: () => player.setDirection(0),
      position: Vector2(size.x / 11, size.y / 1.2),
    );
    ButtonComponent rightButton = ButtonComponent(
      button: SpriteComponent(
        sprite: await Sprite.load('arrow_right.png'),
      ),
      onPressed: () => player.setDirection(1),
      onReleased: () => player.setDirection(0),
      position: Vector2(size.x / 3.5, size.y / 1.2),
    );
    add(leftButton);
    add(rightButton);

    ButtonComponent shootButton = ButtonComponent(
      button: SpriteComponent(
        sprite: await Sprite.load('bullet_button.png'),
      ),
      onPressed: _spawnBullet,
      position: Vector2(size.x / 1.3, size.y / 1.2),
    );
    add(shootButton);
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  // Check keyboard events
  @override
  KeyEventResult onKeyEvent(
    RawKeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    final isKeyDown = event is RawKeyDownEvent;

    if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
      isKeyDown ? player.setDirection(-1) : player.setDirection(0);
    } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
      isKeyDown ? player.setDirection(1) : player.setDirection(0);
    }

    if (event.logicalKey == LogicalKeyboardKey.space) _spawnBullet();

    return super.onKeyEvent(event, keysPressed);
  }

  void _spawnBullet() {
    Bullet bullet = Bullet(
      position: player.position,
    );
    add(bullet);
  }
}
