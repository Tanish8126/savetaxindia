import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savetaxindia/screens/categories/categories.dart';

import '../../expat_dashboard.dart';
import '../../final_tax_dashboard/final_tax_dashboard.dart';
import '../../refund_option.dart';
import '../../tax_input/tax_input.dart';
import '../../tax_summary.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Categories(),
        TextButton(
          onPressed: () {
            Get.to(() => TaxSummaryScreen());
          },
          child: Text("Tax Summary"),
        ),
        TextButton(
          onPressed: () {
            Get.to(() => RefundOptionsScreen());
          },
          child: Text("Refund Options"),
        ),
        TextButton(
          onPressed: () {
            Get.to(() => ExpatFileDashboard());
          },
          child: Text("Expat File Dashboard"),
        ),
        TextButton(
          onPressed: () {
            Get.to(() => TaxDashboardScreen());
          },
          child: Text("Tax Dashboard"),
        ),
        TextButton(
          onPressed: () {
            Get.to(() => TaxInput());
          },
          child: Text("Tax Input"),
        ),
      ],
    );
  }
}
