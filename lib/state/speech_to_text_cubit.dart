import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../contracts.dart';

class SpeechToTextState extends Equatable {
  const SpeechToTextState({
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

class SpeechToTextCubit extends Cubit<SpeechToTextState> {
  SpeechToTextCubit(this.speechToTextService) : super(const SpeechToTextState());

  final SpeechToTextService speechToTextService;

  Future<void> initialize() async {
    final initialized = await speechToTextService.initialize(onTextReceived: _onTextReceived);
    emit(SpeechToTextState(
      initialized: initialized,
      listening: false,
    ));
  }

  Future<void> toggleListening() async {
    if (!state.listening) {
      await speechToTextService.listen();
      emit(SpeechToTextState(
        initialized: state.initialized,
        listening: true,
      ));
    } else {
      emit(SpeechToTextState(
        initialized: state.initialized,
        listening: false,
      ));
    }
  }

  void _onTextReceived({required double confidence, required String text}) {
    emit(SpeechToTextState(
      initialized: state.initialized,
      listening: false,
      text: text,
      confidence: confidence,
    ));
  }
}
