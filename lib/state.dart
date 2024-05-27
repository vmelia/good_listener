import 'package:get_it/get_it.dart';
import 'package:good_listener/state/speech_to_text_cubit.dart';

export "state/speech_to_text_cubit.dart";

void configureState() {
  GetIt.I.registerSingleton<SpeechToTextCubit>(SpeechToTextCubit(GetIt.I()));
}
