import 'dart:math';

import 'package:flame/components.dart';
import 'package:roadcop/enemy.dart';

class EnemyController extends Component with HasGameRef {
  late Timer _timer;

  EnemyController() : super() {
    _timer = Timer(1, onTick: _spawnEnemy, repeat: true);
  }

  @override
  Future<void>? onLoad() async {
    await gameRef.loadSprite('small_car.png');
    await gameRef.loadSprite('small_car_gun.png');
  }

  @override
  void update(double dt) {
    super.update(dt);
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

  /// Enemy Spawner 👾
  void _spawnEnemy() {
    List<String> sprites = [
      'small_car.png',
      'small_car_gun.png',
    ];

    Vector2 spawnPosition = Vector2(
      Random().nextDouble() * gameRef.size.x,
      -64,
    );

    Enemy enemy = Enemy(
      position: spawnPosition,
      spriteName: sprites[Random().nextInt(sprites.length)],
    );
    gameRef.add(enemy);
  }

  void resetSpawner() {
    _timer.stop();
    _timer.start();
  }
}
