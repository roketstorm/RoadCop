import 'package:flame/components.dart';
import 'package:flame/game.dart';

class Player<T extends FlameGame> extends SpriteComponent with HasGameRef<T> {
  final _speed = 200.0;
  double _direction = 0;

  Player({super.position, Vector2? size, super.priority})
      : super(
          size: size ?? Vector2(32, 64),
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('player.png');
  }

  @override
  void update(double dt) {
    super.update(dt);

    position += Vector2(_direction, 0) * _speed * dt;

    position.clamp(
      Vector2.zero() + size * 2.5,
      gameRef.size - size * 2.5,
    );
  }

  void setDirection(double direction) {
    _direction = direction;
  }
}
