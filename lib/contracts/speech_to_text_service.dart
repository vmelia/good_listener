typedef OnTextReceived = void Function({required String text, required double confidence});

abstract class SpeechToTextService {
  Future<bool> initialize({required OnTextReceived onTextReceived});
  Future<void> listen();
}
