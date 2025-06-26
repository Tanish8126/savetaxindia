import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/constants.dart';
import '../../categories/categories.dart';
import '../../my_account_screen/my_account_screen.dart';
import '../../notification_screen/notification_screen.dart';
import 'discount_banner.dart';
import 'promt_field.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //=================Top bar=================
          Padding(
            padding: pdo(0.02, 0, 0.02, 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _circleButton(
                  icon: Icons.grid_view_rounded,
                  onTap: () {
                    Get.toNamed(MyAccountScreen.routeName);
                  },
                ),
                _circleButton(
                  icon: Icons.notifications_none_rounded,
                  onTap: () {
                    Get.toNamed(NotificationScreen.routeName);
                  },
                ),
              ],
            ),
          ),
          //=================Discount Banner=================
          DiscountBanner(),
          //=================Categories=================
          Categories(),
          sh01,
          //=================Prompt Field=================
          PromptField(),
        ],
      ),
    );
  }

  Widget _circleButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: kWhite,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: kBlack.withValues(alpha: 0.1),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        padding: pda(0.02),
        child: Icon(icon, size: 22, color: kBlack.withValues(alpha: 0.8)),
      ),
    );
  }
}
