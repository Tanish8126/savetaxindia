import 'package:flutter/material.dart';

import '../../../utils/constants/constants.dart';
import 'components/body.dart';

class PhoneAuthScreen extends StatelessWidget {
  static String routeName = "./phone_auth_screen.dart";
  const PhoneAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Change the background color to kPrimary
      backgroundColor: kPrimary,
      body: Body(),
    );
  }
}
