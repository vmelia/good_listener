import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../contracts.dart';
import '../../extensions.dart';
import '../../state.dart';

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
    final appTheme = GetIt.I<AppTheme>();
    return Column(
      children: [
        Text(state.helpText, style: appTheme.helpTextStyle.textStyle),
        Expanded(child: Text(state.text, style: appTheme.mainTextStyle.textStyle)),
        Text(state.confidenceText, style: appTheme.confidenceTextStyle.textStyle),
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
