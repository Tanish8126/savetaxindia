import 'package:flutter/material.dart';

import '../../../utils/constants/constants.dart';
import 'components/body.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = '/splash-screen';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //==================Screen Size Initialization==================
    SizeConfig.init(context);
    return Scaffold(
      //Change the background color to kPrimary
      backgroundColor: kPrimary,
      body: Body(),
    );
  }
}
