import 'package:flame_audio/flame_audio.dart';

MenuAudioController music = MenuAudioController();

class MenuAudioController {
  void playMenuMusic() {
    FlameAudio.bgm.initialize();
    FlameAudio.bgm.play('explosion.wav');
  }

  void stopMenuMusic() async {
    FlameAudio.bgm.stop();
  }
}
