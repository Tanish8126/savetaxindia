import 'package:flutter/material.dart';

import '../../utils/constants/constants.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = './home.dart';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text("Save Tax India"),
            TextFormField(initialValue: "Enter Value"),
            FloatingActionButton(onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
