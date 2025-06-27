import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../controller/auth_controller.dart';
import '../../../../../utils/constants/constants.dart';

class GettingOtpBody extends StatelessWidget {
  GettingOtpBody({super.key});
  final AuthController _controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            CircularPercentIndicator(
              radius: 40.0,
              lineWidth: 6.0,
              animation: true,
              animationDuration: 5000,
              restartAnimation: true,
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: kPrimary,
              percent: 1,
              center: CircleAvatar(
                child: Image.asset("assets/images/icon.png"),
              ),
            ),
            sh07,
            Text(
              "Getting OTP on\n+91 ${_controller.phoneNo}",
              style: tsPW(26, FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            sh05,
            Text(
              "This may take a few seconds, please do\nnot refresh or quit the session.",
              style: tsP(18),
              textAlign: TextAlign.center,
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
