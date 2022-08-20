import 'package:flame/components.dart';
import 'package:flame/game.dart';

class Bullet<T extends FlameGame> extends SpriteComponent with HasGameRef<T> {
  final _speed = 500.0;

  Bullet({super.position, Vector2? size})
      : super(
          size: Vector2(4, 8),
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('bullet.png');
  }

  @override
  void update(double dt) {
    super.update(dt);

    position += Vector2(0, -1) * _speed * dt;

    if (position.y < 0) {
      removeFromParent();
    }
  }
}
