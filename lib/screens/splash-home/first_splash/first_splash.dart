import 'package:flutter/material.dart';

import '../../../utils/constants/constants.dart';
import 'components/body.dart';

class FirstSplash extends StatelessWidget {
  static String routeName = './first_splash.dart';
  const FirstSplash({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: const Scaffold(body: Body()));
  }
}
