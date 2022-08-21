import 'package:flame_audio/flame_audio.dart';

MenuAudioController music = MenuAudioController();

class MenuAudioController {
  void playMenuMusic() async {
    FlameAudio.bgm.initialize();
    await FlameAudio.audioCache.load(
      'main_menu.mp3',
    );
    FlameAudio.bgm.play('main_menu.mp3');
  }

  void stopMenuMusic() async {
    FlameAudio.bgm.stop();
  }
}
