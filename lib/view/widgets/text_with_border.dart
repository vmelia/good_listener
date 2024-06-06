import 'package:flutter/material.dart';

class TextWithBorder extends StatelessWidget {
  const TextWithBorder({
    super.key,
    required this.text,
    required this.textStyle,
    required this.colour,
  });
  final String text;
  final TextStyle textStyle;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(border: Border.all(color: colour), borderRadius: BorderRadius.circular(15.0),),
      child: Text(text, style: textStyle),
    );
  }
}
