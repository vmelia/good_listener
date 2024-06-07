import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../contracts.dart';
import '../../extensions.dart';
import '../../state.dart';
import '../../view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final speechToTextCubit = GetIt.I<SpeechCubit>()..initialize();

    return BlocProvider(
      create: (BuildContext context) => speechToTextCubit,
      child: BlocBuilder<SpeechCubit, SpeechState>(
        bloc: speechToTextCubit,
        builder: (context, state) => _HomePageView(state: state),
      ),
    );
  }
}

class _HomePageView extends StatelessWidget {
  const _HomePageView({required this.state});
  final SpeechState state;

  @override
  Widget build(BuildContext context) {
    final speechToTextCubit = GetIt.I<SpeechCubit>();
    final appTheme = GetIt.I<AppTheme>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextWithBorder(
          text: state.helpText,
          textStyle: appTheme.helpTextStyle.textStyle,
          colour: Colors.red,
        ),
        Expanded(
          child: TextWithBorder(
            text: state.text,
            textStyle: appTheme.mainTextStyle.textStyle,
            colour: Colors.blue,
          ),
        ),
        TextWithBorder(
          text: state.confidenceText,
          textStyle: appTheme.confidenceTextStyle.textStyle,
          colour: Colors.green,
        ),
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
