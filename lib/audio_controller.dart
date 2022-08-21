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
      'game_music.mp3',
    ]);
    return super.onLoad();
  }

  void playShoot() {
    FlameAudio.play('shoot.wav', volume: 0.4);
  }

  void playExplosion() {
    FlameAudio.play('explosion.wav', volume: 0.4);
  }

  void playReload() {
    FlameAudio.play('reload.wav', volume: 0.4);
  }

  void playMusic() {
    FlameAudio.bgm.play('game_music.mp3');
  }

  void stopMusic() {
    FlameAudio.bgm.stop();
  }
}
