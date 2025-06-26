import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/constants.dart';
import '../../ay_dropdown/ay_dropdown.dart';
import '../../ay_dropdown/frame/index.dart';
import '../../tax_input_screen/tax_input_screen.dart';
import 'image_upload.dart';
import 'tax_saving_card.dart';

class Body extends StatelessWidget {
  Body({super.key});

  final AYDropdownController ayDropdownController = Get.put(
    AYDropdownController(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: pda(0.03),
        children: [
          // App Bar
          Obx(
            () => AssessmentYearDropdown(
              years: [
                'File ITR for AY 2021-22',
                'File ITR for AY 2022-23',
                'File ITR for AY 2023-24',
                'File ITR for AY 2024-25',
                'File ITR for AY 2025-26',
              ],
              initialValue: ayDropdownController.selectedOption.value,
              onChanged: (selected) {
                ayDropdownController.onChangeOption(selected);
              },
            ),
          ),
          sh01,
          // Subtitle
          Text('Upload your documents for the year 2025.', style: tsB(16)),
          sh02,

          // Image Upload
          const ImageUpload(),
          sh04,

          // Tax-saving opportunities
          Text('Tax-saving opportunities', style: tsBW(18, FontWeight.bold)),
          sh02,

          // Tax Saving Card
          TaxSavingCard(),
          sh04,
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: kGreen,
              foregroundColor: kBlack,
              padding: pds(0, 0.03),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              Get.toNamed(TaxInputScreen.routeName);
            },

            child: Text('Else Do Yourself', style: tsBW(18, FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
