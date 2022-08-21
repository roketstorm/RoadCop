import 'package:flame_audio/flame_audio.dart';

MenuAudioController music = MenuAudioController();

class MenuAudioController {
  void playMenuMusic() {
    FlameAudio.bgm.initialize();
    FlameAudio.bgm.play('main_menu.mp3');
  }

  void stopMenuMusic() async {
    FlameAudio.bgm.stop();
  }
}
