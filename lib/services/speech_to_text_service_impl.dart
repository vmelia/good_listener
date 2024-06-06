import 'package:good_listener/contracts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechToTextServiceImpl implements SpeechToTextService {
  final SpeechToText _speechToText;
  late OnTextReceived _onTextReceived;

  SpeechToTextServiceImpl() : _speechToText = SpeechToText();

  @override
  Future<bool> initialize({required OnTextReceived onTextReceived}) async {
    _onTextReceived = onTextReceived;
    return await _speechToText.initialize();
  }

  @override
  Future<void> listen() async {
      await _speechToText.listen(onResult: _onSpeechResult);
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    _onTextReceived(text: result.recognizedWords, confidence: result.confidence);
  }
}
