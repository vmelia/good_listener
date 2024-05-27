import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../extensions.dart';
import '../state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final speechToTextCubit = GetIt.I<SpeechToTextCubit>()..initialize();

    return BlocProvider(
      create: (BuildContext context) => speechToTextCubit,
      child: BlocBuilder<SpeechToTextCubit, SpeechToTextState>(
        bloc: speechToTextCubit,
        builder: (context, state) => _HomePageView(state: state),
      ),
    );
  }
}

class _HomePageView extends StatelessWidget {
  const _HomePageView({required this.state});
  final SpeechToTextState state;

  @override
  Widget build(BuildContext context) {
    final speechToTextCubit = GetIt.I<SpeechToTextCubit>();
    return Column(
      children: [
        Text(state.helpText),
        Expanded(child: Text(state.text)),
        Text(state.confidenceText),
        FloatingActionButton(
          onPressed: () => speechToTextCubit.toggleListening(),
          child: Icon(
            state.iconData,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
