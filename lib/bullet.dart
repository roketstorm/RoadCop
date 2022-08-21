import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:roadcop/enemy.dart';
import 'package:roadcop/game.dart';

class Bullet<T extends RoadCopGame> extends SpriteComponent
    with HasGameRef<T>, CollisionCallbacks {
  final _speed = 500.0;

  Bullet({super.position, Vector2? size})
      : super(
          size: Vector2(4, 8),
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('bullet.png');
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    position += Vector2(0, -1) * _speed * dt;

    if (position.y < 0) {
      removeFromParent();
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Enemy) {
      gameRef.score += 1;
      removeFromParent();
      gameRef.add(ParticleSystemComponent(
        particle: gameRef.animationParticle(),
        position: position,
      ));
      gameRef.audioController.playExplosion();
    }
  }
}
