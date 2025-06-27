import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/constants/constants.dart';

class UserImageSection extends StatelessWidget {
  const UserImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/bg_image.png"),
        sh01,
        Padding(
          padding: pda(0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundImage: const AssetImage("assets/images/profile.png"),
                backgroundColor: Colors.grey[800],
                radius: 30.r,
              ),
              OutlinedButton(
                onPressed: () {
                  Get.back();
                },
                style: TextButton.styleFrom(),
                child: Text(
                  "Cancel",
                  style: tsCommonW(
                    12,
                    FontWeight.w700,
                    const Color(0xff343434),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
