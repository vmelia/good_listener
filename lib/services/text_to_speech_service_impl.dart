import 'package:flutter_tts/flutter_tts.dart';
import 'package:good_listener/contracts.dart';

class TextToSpeechServiceImpl implements TextToSpeechService {
  late FlutterTts _textToSpeech;

  @override
  void initialize() {
    _textToSpeech = FlutterTts();
  }

  @override
  Future<dynamic> speak(String text) async => await _textToSpeech.speak(text);
}
