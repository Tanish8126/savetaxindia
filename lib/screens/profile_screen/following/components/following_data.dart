import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/constants.dart';
import '../../profile_screen.dart';

// FollowingData displays a single user's avatar and name in the followers/following list.
class FollowingData extends StatelessWidget {
  const FollowingData({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the selected user's profile screen with arguments
        Get.toNamed(
          ProfileScreen.routeName,
          arguments: {'uid': '123', 'username': 'Tanish', 'bio': 'Hello'},
        );
      },
      child: Row(
        children: [
          // User's profile image
          CircleAvatar(
            backgroundImage: const AssetImage("assets/images/profile.png"),
            backgroundColor: Colors.grey[800],
            radius: 20.r,
          ),
          sw04,
          // User's name
          Text("Guman", style: tsBW(16, FontWeight.w600)),
        ],
      ),
    );
  }
}
