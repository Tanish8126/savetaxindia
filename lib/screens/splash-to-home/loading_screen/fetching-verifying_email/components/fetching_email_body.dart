import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../utils/constants/constants.dart';
import '../frame/controller.dart';

class FetchingEmailBody extends StatelessWidget {
  const FetchingEmailBody({super.key});

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
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: kPrimary,
            percent: (LoadingEmailController().percent.value) / 100,
            center: CircleAvatar(child: Image.asset("assets/images/icon.png")),
          ),
          sh07,
          Text(
            "We are fetching your email\ndetails for verification",
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
