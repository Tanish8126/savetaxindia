import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../utils/constants/constants.dart';

class VerifyEmailBody extends StatelessWidget {
  const VerifyEmailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          CircularPercentIndicator(
            radius: 40.0,
            lineWidth: 6.0,
            animation: true,
            restartAnimation: true,
            animationDuration: 5000,
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: kPrimary,
            percent: 1,
            center: CircleAvatar(child: Image.asset("assets/images/icon.png")),
          ),
          sh07,
          Text(
            "Verifying your email\ncredentials",
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
    );
  }
}
