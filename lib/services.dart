import 'package:get_it/get_it.dart';

import 'contracts.dart';
import 'services.dart';

export "services/speech_to_text_service_impl.dart";

void configureServices() {
  GetIt.I.registerSingleton<SpeechToTextService>(SpeechToTextServiceImpl());
}
