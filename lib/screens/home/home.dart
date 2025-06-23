import 'package:flutter/material.dart';

import '../../utils/constants/constants.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = './home.dart';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Save Tax India"),
        centerTitle: false,
        actions: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.search,
              color: kWhite,
              size: SizeConfig.screenHeight * 0.04,
            ),
          ),
        ],
      ),
      body: const Body(),
    );
  }
}
