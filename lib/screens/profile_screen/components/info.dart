import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/constants/constants.dart';
import 'editprofile_screen.dart';
import 'followers_screen.dart';

class Info extends StatelessWidget {
  Info({super.key});

  final _user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pds(0.02, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //==================Edit Profile Button==================
          Align(
            alignment: Alignment.centerRight,
            child: OutlinedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.transparent),
              ),
              onPressed: () {
                Get.toNamed(EditProfileScreen.routeName);
              },
              child: const Text("Edit"),
            ),
          ),
          //==================User Name==================
          Text(
            _user?.displayName != null ? "Tanish" : "User",
            style: tsBW(18, FontWeight.w700),
          ),

          //==================User Bio==================
          sh01,
          Text(
            _user?.displayName != null
                ? "Anonymity grants me the power to deliver into genuine conversations"
                : "Anonymity grants me the power to delve into genuine conversations",
            style: tsCommonW(
              13,
              FontWeight.w400,
              const Color.fromARGB(255, 0, 0, 0),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //==================Institute==================
              TextButton.icon(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/gps.svg",
                  height: 20.h,
                  colorFilter: const ColorFilter.mode(
                    Color.fromARGB(255, 46, 90, 1),
                    BlendMode.srcIn,
                  ),
                ),
                label: Text(
                  "Salaried",
                  style: tsCommonW(
                    15,
                    FontWeight.w700,
                    const Color.fromARGB(255, 46, 90, 1),
                  ),
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/flash.svg",
                    height: 20.h,
                    colorFilter: const ColorFilter.mode(
                      Color(0xFFFFA3A3),
                      BlendMode.srcIn,
                    ),
                  ),
                  Text(
                    "999",
                    style: tsCommonW(
                      15,
                      FontWeight.w700,
                      const Color(0xFFFFA3A3),
                    ),
                  ),
                ],
              ),

              TextButton.icon(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/people.svg",
                  height: 20.h,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF7059FF),
                    BlendMode.srcIn,
                  ),
                ),
                label: Text(
                  "999",
                  style: tsCommonW(
                    15,
                    FontWeight.w700,
                    const Color(0xFF7059FF),
                  ),
                ),
              ),
              sw05,
            ],
          ),

          Row(
            children: [
              //==================Followers==================
              ShaderMask(
                shaderCallback: (Rect bounds) =>
                    const LinearGradient(
                      colors: [Color(0xFFAB8DFF), Color(0xFF63D0FF)],
                    ).createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    ),
                child: TextButton(
                  onPressed: () {
                    Get.toNamed(FollowersScreen.routeName);
                  },
                  child: Text(
                    "20 Followers",
                    style: TextStyle(
                      fontSize: getProportionateScreenHeight(15),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              sw09,
              //==================Following==================
              ShaderMask(
                shaderCallback: (Rect bounds) =>
                    const LinearGradient(
                      colors: [Color(0xFFAB8DFF), Color(0xFF63D0FF)],
                    ).createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    ),
                child: TextButton(
                  onPressed: () {
                    Get.toNamed(FollowersScreen.routeName);
                  },
                  child: Text(
                    "20 Following",
                    style: TextStyle(
                      fontSize: getProportionateScreenHeight(15),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
          ?_user != null
              ? null
              : SizedBox(
                  width: double.infinity,
                  height: 40.h,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      side: WidgetStateProperty.all(
                        BorderSide(
                          color: kBlack.withValues(alpha: 0.5),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Text(
                      "Unfollow",
                      style: tsCommonW(15, FontWeight.w700, kBlack),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
