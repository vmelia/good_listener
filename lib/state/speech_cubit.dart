import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../contracts.dart';

class SpeechState extends Equatable {
  const SpeechState({
    this.initialized = false,
    this.listening = false,
    this.text = '',
    this.confidence = 0.0,
  });
  final bool initialized;
  final bool listening;
  final String text;
  final double confidence;

  @override
  List<Object?> get props => [initialized, listening, text, confidence];
}

class SpeechCubit extends Cubit<SpeechState> {
  SpeechCubit(this.speechToTextService, this.textToSpeechService) : super(const SpeechState());
  final SpeechToTextService speechToTextService;
  final TextToSpeechService textToSpeechService;

  Future<void> initialize() async {
    final initialized = await speechToTextService.initialize(onTextReceived: _onTextReceived);
    textToSpeechService.initialize();

    emit(SpeechState(
      initialized: initialized,
      listening: false,
    ));
  }

  Future<void> toggleListening() async {
    if (!state.listening) {
      await speechToTextService.listen();
      emit(SpeechState(
        initialized: state.initialized,
        listening: true,
      ));
    } else {
      emit(SpeechState(
        initialized: state.initialized,
        listening: false,
      ));
    }
  }

  void _onTextReceived({required double confidence, required String text}) async {
    if (confidence > 0.0) {
      await textToSpeechService.speak(text);
    }

    emit(SpeechState(
      initialized: state.initialized,
      listening: false,
      text: text,
      confidence: confidence,
    ));
  }
}
