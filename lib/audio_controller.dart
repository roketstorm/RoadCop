import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';

class AudioController extends Component {
  @override
  Future<void>? onLoad() async {
    FlameAudio.bgm.initialize();

    await FlameAudio.audioCache.loadAll([
      'explosion.wav',
      'shoot.wav',
      'reload.wav',
      'click.wav',
    ]);
    return super.onLoad();
  }

  void playShoot() {
    FlameAudio.play('shoot.wav');
  }

  void playExplosion() {
    FlameAudio.play('explosion.wav');
  }

  void playReload() {
    FlameAudio.play('reload.wav');
  }

  void playMusic() {
    FlameAudio.bgm.play('');
  }

  void stopMusic() {
    FlameAudio.bgm.stop();
  }
}
