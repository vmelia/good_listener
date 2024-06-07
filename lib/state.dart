import 'package:get_it/get_it.dart';

import 'state.dart';

export "state/speech_cubit.dart";

void configureState() {
  GetIt.I.registerSingleton<SpeechCubit>(SpeechCubit(GetIt.I(), GetIt.I()));
}
