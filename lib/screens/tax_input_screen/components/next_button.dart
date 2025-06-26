import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/constants.dart';
import '../../final_tax_dashboard/final_tax_dashboard.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryGreen = Color(0xFF2E8B57);
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(TaxDashboardScreen.routeName);
        },
        child: Container(
          decoration: BoxDecoration(
            color: primaryGreen,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: primaryGreen.withAlpha((255 * 0.2).toInt()),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(18),
          child: const Icon(Icons.arrow_forward, color: kWhite, size: 28),
        ),
      ),
    );
  }
}
