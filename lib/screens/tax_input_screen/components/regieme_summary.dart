import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/sizedbox.dart';
import '../../edit_income/edit_income.dart';
import 'infocard.dart';

Widget regimeSummaryContent(Color primaryGreen) {
  return Column(
    children: [
      // Cards
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            infoCard(
              title: "Total Income",
              amount: "72.144",
              onEdit: () {
                Get.toNamed(EditIncomeScreen.routeName);
              },
              onAdd: () {},
            ),
            sh02,
            infoCard(
              title: "Total Deductions",
              amount: "12.323",
              onEdit: () {
                Get.toNamed(EditIncomeScreen.routeName);
              },
              onAdd: () {},
            ),
          ],
        ),
      ),
    ],
  );
}
