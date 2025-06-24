import 'package:flutter/material.dart';

import '../../../utils/constants/constants.dart';
import 'assestment_year.dart';
import 'image_upload.dart';
import 'tax_saving_card.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: pda(0.03),
        children: [
          // App Bar
          AssessmentYearDropdown(
            years: [
              'File ITR for AY 2021-22',
              'File ITR for AY 2022-23',
              'File ITR for AY 2023-24',
              'File ITR for AY 2024-25',
              'File ITR for AY 2025-26',
            ],
            initialValue: 'File ITR for AY 2025-26',
            onChanged: (selected) {
              // Handle the selected year
              //  print('Selected AY: $selected');
            },
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
        ],
      ),
    );
  }
}
