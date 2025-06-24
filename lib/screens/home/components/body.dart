import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/constants.dart';
import '../../categories/categories.dart';
import '../../push_notification/push_notification.dart';
import '../../upload_file_screen/upload_file_screen.dart';
import 'discount_banner.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _circleButton(
                  icon: Icons.grid_view_rounded,
                  onTap: () {
                    Get.toNamed(PushNotification.routeName);
                  },
                ),
                _circleButton(
                  icon: Icons.notifications_none_rounded,
                  onTap: () {
                    Get.toNamed(UploadFileScreen.routeName);
                  },
                ),
              ],
            ),
          ),
          //=================Discount Banner=================
          DiscountBanner(),
          //=================Categories=================
          Categories(),
          SizedBox(height: 16),
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
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Icon(icon, size: 22, color: Colors.black87),
      ),
    );
  }
}

class PromptField extends StatelessWidget {
  const PromptField({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: pds(0.02, 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello", style: tsB(18)),
            sh01,
            TextFormField(
              textAlign: TextAlign.left,
              textCapitalization: TextCapitalization.words,
              maxLength: 250,
              maxLines: 10,
              decoration: InputDecoration(
                hintText: "I Spit it out.....",
                filled: true,
                fillColor: kBlack.withValues(alpha: 0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: kBlack.withValues(alpha: 0.6)),
                ),
                hintStyle: tsCommon(16, kBlack.withValues(alpha: 0.6)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
