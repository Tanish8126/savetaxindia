import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:savetaxindia/icai/salaries/pension.dart';

import '../../utils/constants/constants.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = './home.dart';
  HomeScreen({super.key});

  final TextEditingController _tweetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text("Save Tax India"),
            Expanded(
              child: TextFormField(
                controller: _tweetController,
                textAlign: TextAlign.left,
                keyboardType: TextInputType.number,
                // maxLength: 250,
                //maxLines: 10,
                decoration: InputDecoration(
                  hintText: "Enrw iijddi.....",
                  hintStyle: tsCommon(16, kWhite),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                caml(_tweetController.text, 60);
              },
            ),
            Text(""),
          ],
        ),
      ),
    );
  }
}
