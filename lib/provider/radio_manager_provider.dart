import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class RadioManagerProvider extends ChangeNotifier {
  String? _currentPlayingUrl;

  final AudioPlayer _player = AudioPlayer();
  bool _isPlaying = false;

  String? get currentPlayingUrl => _currentPlayingUrl;

  bool? get isPlaying => _isPlaying;
  double? currentVolume = 2.0;

  Future<void> play(String url) async {
    if (_currentPlayingUrl == url) {
      _isPlaying ? await _player.pause() : await _player.resume();
      _isPlaying = !_isPlaying;
    } else {
      await _player.stop();
      _currentPlayingUrl = url;
      await _player.play(UrlSource(url), volume: currentVolume);
      _isPlaying = true;
    }
    notifyListeners();
  }

  Future<void> stop() async {
    await _player.stop();
    _currentPlayingUrl = null;
    _isPlaying = false;
    notifyListeners();
  }

  Future<void> setVolume(double volume) async {
    currentVolume = volume;
    await _player.setVolume(volume);
    notifyListeners();
  }
}
