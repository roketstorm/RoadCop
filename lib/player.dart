import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:roadcop/bullet_enemy.dart';
import 'package:roadcop/enemy.dart';
import 'package:roadcop/game.dart';

class Player<T extends RoadCopGame> extends SpriteComponent
    with HasGameRef<T>, CollisionCallbacks {
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
    add(RectangleHitbox());
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

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Enemy || other is BulletEnemy) {
      removeFromParent();
      gameRef.add(ParticleSystemComponent(
        particle: gameRef.animationParticle(),
        position: position,
      ));
      gameRef.audioController.playExplosion();
    }
  }
}
