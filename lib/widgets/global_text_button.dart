import 'package:flutter/material.dart';

class GlobalTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const GlobalTextButton(
      {required this.onPressed, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: Text(text));
  }
}
