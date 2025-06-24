import 'package:flutter/material.dart';

class GptScreen extends StatelessWidget {
  static const String routeName = '/gpt_screen';
  const GptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [Text('Gpt Screen'), TextFormField()]);
  }
}
