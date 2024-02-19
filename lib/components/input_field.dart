import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, textAlign: TextAlign.left),
        const TextField(),
      ],
    );
  }
}
