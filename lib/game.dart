import 'package:flame/components.dart';
import 'package:flame/game.dart';

class RoadCopGame extends FlameGame {
  @override
  Future<void>? onLoad() async {
    await images.load('player.png');
    SpriteComponent player = SpriteComponent(
        sprite: Sprite(images.fromCache('player.png')),
        position: Vector2(0, 0));

    add(player);
    return super.onLoad();
  }
}
