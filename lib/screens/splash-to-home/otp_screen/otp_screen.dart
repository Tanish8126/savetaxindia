import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth_controller.dart';
import '../../../utils/constants/constants.dart';
import 'components/otp_screen_body.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otpscreen";
  final authController = Get.put(AuthController());

  OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Change the background color to kPrimary
      backgroundColor: kPrimary,
      body: OtpScreenBody(),
    );
  }
}
