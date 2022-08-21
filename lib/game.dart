import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/parallax.dart';
import 'package:flame/particles.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roadcop/audio_controller.dart';
import 'package:roadcop/bullet.dart';
import 'package:roadcop/enemy.dart';
import 'package:roadcop/enemy_controller.dart';
import 'package:roadcop/player.dart';

class RoadCopGame extends FlameGame
    with KeyboardEvents, HasTappables, HasCollisionDetection {
  late final Player player;
  late final TextComponent _scoreText;
  late final EnemyController enemyController;
  late final AudioController audioController;

  int score = 0;

  @override
  Future<void>? onLoad() async {
    add(ScreenHitbox());

    await images.load('explosion.png');

    // Set scrolling background
    ParallaxComponent road = await ParallaxComponent.load(
      [
        ParallaxImageData('road.png'),
        ParallaxImageData('roadblock.png'),
      ],
      fill: LayerFill.width,
      repeat: ImageRepeat.repeat,
      baseVelocity: Vector2(0, -300),
    );
    add(road);

    // Initialize player
    player = Player(
      position: size / 1.4,
    );
    add(player);

    enemyController = EnemyController();
    add(enemyController);

    ButtonComponent leftButton = ButtonComponent(
      button: SpriteComponent(
        sprite: await Sprite.load('arrow_left.png'),
      ),
      onPressed: () => player.setDirection(-1),
      onReleased: () => player.setDirection(0),
      position: Vector2(size.x / 11, size.y / 1.2),
      priority: 1,
    );
    ButtonComponent rightButton = ButtonComponent(
      button: SpriteComponent(
        sprite: await Sprite.load('arrow_right.png'),
      ),
      onPressed: () => player.setDirection(1),
      onReleased: () => player.setDirection(0),
      position: Vector2(size.x / 3.5, size.y / 1.2),
      priority: 1,
    );
    add(leftButton);
    add(rightButton);

    ButtonComponent shootButton = ButtonComponent(
      button: SpriteComponent(
        sprite: await Sprite.load('bullet_button.png'),
      ),
      onPressed: _spawnBullet,
      position: Vector2(size.x / 1.3, size.y / 1.2),
      priority: 1,
    );
    add(shootButton);

    _scoreText = TextComponent(
      text: '0',
      position: Vector2(size.x / 1.7, size.y / 1.16),
      anchor: Anchor.center,
      textRenderer: TextPaint(
          style: const TextStyle(
        color: Color.fromRGBO(0, 200, 0, 1.0),
        fontFamily: 'Alarm',
        fontSize: 48,
        shadows: [Shadow(offset: Offset(3, 3), blurRadius: 0.0)],
      )),
      priority: 1,
    );
    add(_scoreText);

    audioController = AudioController();
  }

  @override
  void update(double dt) {
    super.update(dt);
    _scoreText.text = '$score';

    if (!player.isMounted) overlays.add('GameOverScreen');
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
    audioController.playShoot();
  }

  @override
  void onAttach() {
    audioController.playMusic();
    super.onAttach();
  }

  @override
  void onDetach() {
    audioController.stopMusic();
    super.onDetach();
  }

  Particle animationParticle() {
    return SpriteAnimationParticle(
      animation: getBoomAnimation(),
      size: Vector2(64, 64),
    );
  }

  SpriteAnimation getBoomAnimation() {
    const columns = 8;
    const rows = 1;
    const frames = columns * rows;
    final spriteImage = images.fromCache('explosion.png');
    final spritesheet = SpriteSheet.fromColumnsAndRows(
      image: spriteImage,
      columns: columns,
      rows: rows,
    );
    final sprites = List<Sprite>.generate(frames, spritesheet.getSpriteById);
    return SpriteAnimation.spriteList(sprites, stepTime: 0.1);
  }

  void resetGame() {
    score = 0;
    enemyController.resetSpawner();

    children.whereType<Bullet>().forEach((element) {
      element.removeFromParent();
    });

    children.whereType<Enemy>().forEach((element) {
      element.removeFromParent();
    });

    // Respawn player
    player.position = size / 1.4;
    add(player);

    overlays.remove('GameOverScreen');
    audioController.playReload();
  }
}
