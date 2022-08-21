import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:roadcop/bullet.dart';
import 'package:roadcop/bullet_enemy.dart';

class Enemy extends SpriteComponent with HasGameRef, CollisionCallbacks {
  final double _speed = 100;
  String spriteName;
  late Timer _timer;

  Enemy({
    super.position,
    Vector2? size,
    required this.spriteName,
  }) : super(
          size: Vector2(32, 60),
          anchor: Anchor.center,
        ) {
    _timer = Timer(1, onTick: _spawnBullets, repeat: true);
  }

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite(spriteName);
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

    _timer.update(dt);
  }

  @override
  void onMount() {
    super.onMount();
    _timer.start();
  }

  @override
  void onRemove() {
    super.onRemove();
    _timer.stop();
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Bullet) removeFromParent();
  }

  void _spawnBullets() {
    if (spriteName == 'small_car_gun.png') {
      BulletEnemy bulletEnemy = BulletEnemy(
        position: position,
      );
      gameRef.add(bulletEnemy);
    }
  }
}
