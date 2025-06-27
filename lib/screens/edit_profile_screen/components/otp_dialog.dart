import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../../controller/auth_controller.dart';
import '../../../../utils/constants/constants.dart';

final authController = Get.put(AuthController());
final TextEditingController _pinPutController = TextEditingController();

final defaultPinTheme = PinTheme(
  width: getProportionateScreenHeight(60),
  height: getProportionateScreenWidth(60),
  textStyle: tsP(20),
  decoration: bdCircular(kPrimary, 20),
);

void otpDialog(dynamic context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        insetPadding: pds(0.02, 0.05),
        backgroundColor: kPink,
        child: Builder(
          builder: (context) {
            return SizedBox(
              height: SizeConfig.screenHeight * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Enter OTP sent on ${authController.phoneNo}",
                    style: tsW(18),
                  ),
                  Pinput(
                    defaultPinTheme: defaultPinTheme,
                    length: 6,
                    // androidSmsAutofillMethod:
                    //     AndroidSmsAutofillMethod.smsRetrieverApi,
                    controller: _pinPutController,
                    pinContentAlignment: Alignment.center,
                    pinAnimationType: PinAnimationType.fade,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          authController.otp.value = _pinPutController.text;
                          authController.verifyOTP();
                        },
                        style: TextButton.styleFrom(backgroundColor: kBlack),
                        child: Text("Verify", style: tsP(16)),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(backgroundColor: kBlack),
                        child: Text("Cancel", style: tsP(16)),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}
