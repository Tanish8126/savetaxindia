import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../../utils/constants/constants.dart';
import '../../../../controller/auth_controller.dart';
import '../../otp_screen/otp_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  //==================Form Key==================
  final _formKey = GlobalKey<FormState>();

  //==================Auth Controller==================
  final _authController = Get.put(AuthController());

  //==================Text Editing Controller==================
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: pda(0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //==================Spacer==================
            const Spacer(),

            //==================Enter your number Text==================
            Text("Enter your number", style: tsPW(24, FontWeight.bold)),
            sh02,

            //==========Mobile Number Input Field======
            TextFormField(
              style: tsWW(26, FontWeight.bold),
              textAlign: TextAlign.center,
              controller: _controller,
              //===============Max Length is 10===============
              inputFormatters: [LengthLimitingTextInputFormatter(10)],
              keyboardType: TextInputType.number,
              //===============Validator==================
              validator: (number) =>
                  vPhoneValidator.hasMatch(number!) ? null : fPhoneNumber,
              onChanged: (val) {
                _authController.phoneNo.value = val;
              },
              onSaved: (val) => _authController.phoneNo.value = val!,
              //===============Decoration==================
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                fillColor: kBlack,
                //===============Indian Flag==================
                prefixIcon: SizedBox(
                  width: getProportionateScreenWidth(70),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(color: Color(0xFF949494)),
                    child: Text('IND', style: tsWW(18, FontWeight.bold)),
                  ),
                ),
                //===============Hint Text==================
                hintText: "3333-333-333",
                hintStyle: tsCommonW(26, FontWeight.bold, kButton),
              ),
            ),
            sh05,
            SizedBox(
              width: double.infinity,
              height: getProportionateScreenHeight(65),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),

                  backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _authController.getOtp(context);
                    Get.toNamed(OtpScreen.routeName);
                  }
                },
                child: Text("Continue", style: tsB(18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
