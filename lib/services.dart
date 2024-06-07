import 'package:get_it/get_it.dart';

import 'contracts.dart';
import 'services.dart';

export "services/speech_to_text_service_impl.dart";
export "services/text_to_speech_service_impl.dart";

void configureServices() {
  GetIt.I.registerSingleton<SpeechToTextService>(SpeechToTextServiceImpl());
  GetIt.I.registerSingleton<TextToSpeechService>(TextToSpeechServiceImpl());
}
