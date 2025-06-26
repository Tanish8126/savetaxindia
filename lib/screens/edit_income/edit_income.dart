import 'package:flutter/material.dart';

import '../../utils/constants/constants.dart';
import '../tax_input_screen/components/next_button.dart';
import 'compnents/income_edit_content.dart';

class EditIncomeScreen extends StatelessWidget {
  static String routeName = './edit_income.dart';
  const EditIncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Colors
    const Color primaryGreen = Color(0xFF2E8B57);
    const Color lightGreen = Color(0xFFEAF7F0);

    return Scaffold(
      backgroundColor: lightGreen,
      appBar: AppBar(
        title: const Text("Edit Income"),
        backgroundColor: lightGreen,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: tsBW(20, FontWeight.bold),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IncomeEditContent(primaryGreen: primaryGreen), // New Tax Regime
              const SizedBox(height: 32), Center(child: NextButton()),
            ],
          ),
        ),
      ),
    );
  }
}
