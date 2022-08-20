import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:roadcop/bullet.dart';

class Enemy extends SpriteComponent with HasGameRef, CollisionCallbacks {
  double _speed = 100;

  Enemy({super.position, Vector2? size})
      : super(
          size: Vector2(32, 64),
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('player.png');
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    position += Vector2(0, 1) * _speed * dt;

    position.clamp(
      Vector2(0 + size.x * 2.5, -64),
      Vector2(gameRef.size.x - size.x * 2.5, gameRef.size.y + size.y),
    );

    if (position.y > gameRef.size.y + size.y) {
      removeFromParent();
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Bullet) removeFromParent();
  }
}
