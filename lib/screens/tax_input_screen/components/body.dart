import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/constants.dart';
import '../../ay_dropdown/ay_dropdown.dart';
import '../../ay_dropdown/frame/index.dart';
import '../../employment_type/employment_type.dart';
import 'bottom_line.dart';
import 'next_button.dart';
import 'regieme_summary.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final AYDropdownController ayDropdownController = Get.put(
    AYDropdownController(),
  );

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Colors
    const Color primaryGreen = Color(0xFF2E8B57);

    return SafeArea(
      child: Column(
        children: [
          //============Tab Bar for regimes==============
          Padding(
            padding: pds(0.02, 0),
            child: TabBar(
              controller: _tabController,
              labelColor: primaryGreen,
              unselectedLabelColor: Colors.grey,
              indicatorColor: primaryGreen,
              tabs: const [
                Tab(text: 'New Tax Regime'),
                Tab(text: 'Old Tax Regime'),
              ],
            ),
          ),

          //=====================Info text=====================
          // Padding(
          //   padding: pds(0.02, 0),
          //   child: Text(
          //     "We've automatically pre-filled your tax return\nwith the information below:",
          //     textAlign: TextAlign.center,
          //     style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
          //   ),
          // ),
          // sh01,

          //===========Assessment Year Dropdown============
          AssessmentYearDropdown(
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

          EmploymentType(),
          sh01,

          //=====================TabBarView for regime-specific content=====================
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                regimeSummaryContent(primaryGreen), // New Tax Regime
                regimeSummaryContent(primaryGreen), // Old Tax Regime
              ],
            ),
          ),

          const SizedBox(height: 32),
          // Refund
          Text(
            "Net Income",
            style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            "₹ 3,850",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 36,
              color: primaryGreen,
            ),
          ),
          sh02,
          BottomLine(),
          const Spacer(),

          //=====================Next button=====================
          NextButton(),
        ],
      ),
    );
  }
}
