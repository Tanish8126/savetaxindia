import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/constants.dart';
import '../../profile_screen.dart';

class FollowingData extends StatelessWidget {
  const FollowingData({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          ProfileScreen.routeName,
          arguments: {'uid': '123', 'username': 'Tanish', 'bio': 'Hello'},
        );
      },
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: const AssetImage("assets/images/profile.png"),
            backgroundColor: Colors.grey[800],
            radius: 20.r,
          ),
          sw04,
          Text("Guman", style: tsBW(16, FontWeight.w600)),
        ],
      ),
    );
  }
}
