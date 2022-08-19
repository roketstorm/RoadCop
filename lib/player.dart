import 'package:flame/components.dart';
import 'package:flame/game.dart';

class Player<T extends FlameGame> extends SpriteComponent with HasGameRef<T> {
  Player({super.position, Vector2? size, super.priority})
      : super(
          size: size ?? Vector2(32, 64),
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('player.png');
  }
}
