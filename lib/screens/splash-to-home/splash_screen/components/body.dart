import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../utils/constants/constants.dart';
import '../../../../../utils/default_button.dart';
import '../../phone_auth_screen/phone_auth_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pds(0.02, 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //==================Lock Image==================
          SizedBox(child: Image.asset("assets/images/lock.png")),

          //==================Save Tax India Text====== ============
          Text("Save Tax India", style: tsWW(26, FontWeight.bold)),
          sh02,
          Text(
            "because we all know you can't resist it",
            style: tsCommon(16, kGreen),
          ),
          sh07,
          DefaultButton(
            text: "Continue",
            press: () {
              Get.toNamed(PhoneAuthScreen.routeName);
            },
            size: 18,
          ),
        ],
      ),
    );
  }
}
