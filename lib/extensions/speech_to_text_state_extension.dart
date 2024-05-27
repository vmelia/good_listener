import 'package:flutter/material.dart';

import '../state.dart';

extension SpeechToTextStateExtension on SpeechToTextState {
  String get helpText {
    if (!initialized) {
      return 'Speech not available.';
    }

    return listening ? 'Listening...' : 'Tap the microphone button to start listening.';
  }

  String get confidenceText {
    if (confidence > 0.0) {
      return 'Confidence ${(confidence * 100).toStringAsFixed(1)}';
    }

    return '';
  }

  IconData get iconData => listening ? Icons.mic_off : Icons.mic;
}
