import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:roadcop/game.dart';
import 'package:roadcop/player.dart';

class BulletEnemy<T extends RoadCopGame> extends SpriteComponent
    with HasGameRef<T>, CollisionCallbacks {
  final _speed = 500.0;

  BulletEnemy({super.position, Vector2? size})
      : super(
          size: Vector2(8, 8),
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('bullet_enemy.png');
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    position += Vector2(0, 1) * _speed * dt;

    if (position.y > gameRef.size.y) {
      removeFromParent();
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Player) {
      removeFromParent();
    }
  }
}
