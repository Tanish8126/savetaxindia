import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/constants.dart';
import '../../tax_input_screen/tax_input_screen.dart';
import 'bottom_section.dart';
import 'year_box.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pda(0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Choose a tax year", style: tsBW(22, FontWeight.bold)),
          sh01,
          Text(
            "We’ll sign you up for an account, so you can start filing. A tax refund might be waiting!",
            style: tsCommonW(
              15,
              FontWeight.w500,
              kBlack.withValues(alpha: 0.7),
            ),
          ),
          sh01,

          //=====================Year Box=====================
          YearBox(),
          sh03,

          //=====================Sign up Button=====================
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
                foregroundColor: kBlack,
                padding: pds(0, 0.04),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Get.toNamed(TaxInputScreen.routeName);
              },
              child: Text("Sign up", style: TextStyle(fontSize: 18)),
            ),
          ),
          sh05,

          //=====================Privacy Policy=====================
          BottomSection(),
        ],
      ),
    );
  }
}
