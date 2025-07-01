import 'package:flutter/material.dart';

import '../../../../../utils/constants/constants.dart';
import 'opt_input.dart';

class OtpScreenBody extends StatelessWidget {
  const OtpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pds(0.02, 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //==================Spacer==================
          sh02,

          //==================Enter The OTP Text==================
          Text("Enter The OTP", style: tsPW(24, FontWeight.bold)),

          //==================Space==================
          sh01,
          OtpInput(),
        ],
      ),
    );
  }
}
