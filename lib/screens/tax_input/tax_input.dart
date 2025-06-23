import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savetaxindia/utils/default_button.dart';

import '../../icai/salaries/gratuity.dart';
import '../../utils/constants/constants.dart';
import '../employment_type/employment_type.dart';
import '../employment_type/frame/index.dart';

class TaxInput extends StatelessWidget {
  static const String routeName = '/tax-input';
  TaxInput({super.key});

  final Gratuity entall = Gratuity();
  final EmploymentTypeController employmentTypeController = Get.put(
    EmploymentTypeController(),
  );
  final TextEditingController _basicSalaryController = TextEditingController();
  final TextEditingController _entertainmentAllowanceController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tax Input"),
        actions: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.search,
              //   color: kCream,
              size: SizeConfig.screenHeight * 0.06,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          EmploymentType(),
          TextFormField(
            controller: _basicSalaryController,
            textAlign: TextAlign.left,
            keyboardType: TextInputType.number,

            decoration: InputDecoration(
              hintText: "Salary per month",
              hintStyle: tsCommon(16, kWhite),
            ),
          ),
          TextFormField(
            controller: _entertainmentAllowanceController,
            textAlign: TextAlign.left,
            keyboardType: TextInputType.number,

            decoration: InputDecoration(
              hintText: "Enrw iijddi.....",
              hintStyle: tsCommon(16, kWhite),
            ),
          ),
          Text("data"),
          DefaultButton(
            text: "Calculate",
            size: 20,
            press: () {
              // Assuming you have separate controllers for each field, e.g.:
              // _basicSalaryController and _entertainmentAllowanceController
              // Also, ensure to parse the text to int as required by the method signature
              int basicSalary = int.tryParse(_basicSalaryController.text) ?? 0;
              // int entertainmentAllowanceReceived =
              //     int.tryParse(_entertainmentAllowanceController.text) ?? 0;
              entall.gratuityExemption(
                gratuityReceived: 100000,
                isGovtEmployee:
                    employmentTypeController.selectedOption.value ==
                    "Government",
                isCoveredUnderGratuityAct:
                    employmentTypeController.selectedOption.value ==
                    "Government", // Changed from null to a valid bool
                lastDrawnSalary: basicSalary
                    .toDouble(), // Convert int to double
              );
            },
          ),
        ],
      ),
    );
  }
}
