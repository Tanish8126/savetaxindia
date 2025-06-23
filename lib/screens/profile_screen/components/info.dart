// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/constants/constants.dart';
import 'editprofile_screen.dart';
import 'followers_screen.dart';

class Info extends StatelessWidget {
  const Info({super.key});

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
              style: const ButtonStyle(),
              onPressed: () {
                Get.toNamed(EditProfileScreen.routeName);
              },
              child: const Text("Edit"),
            ),
          ),
          //==================User Name==================
          Text("Rahul Gupta", style: tsBW(18, FontWeight.w700)),

          //==================User Bio==================
          sh02,
          Text(
            "Anonymity grants me the power to delve into genuine conversations",
            style: tsCommonW(
              13,
              FontWeight.w400,
              const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          sh02,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //==================Institute==================
              TextButton.icon(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/gps.svg",
                  height: 20.h,
                  color: const Color(0xFFD9FFBB),
                ),
                label: Text(
                  "Nmims",
                  style: tsCommonW(
                    15,
                    FontWeight.w700,
                    const Color(0xFFD9FFBB),
                  ),
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/flash.svg",
                    height: 20.h,
                    color: const Color(0xFFFFA3A3),
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
                  color: const Color(0xFF7059FF),
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
          sh02,
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
        ],
      ),
    );
  }

  //   Future<void> _showSimpleDialog(BuildContext context) async {
  //     await showDialog<void>(
  //       context: context,
  //       barrierColor: ktrans,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           backgroundColor: ktrans,
  //           contentPadding: pda(0.0),
  //           alignment: Alignment.center,
  //           content: Container(
  //             width: 333,
  //             height: 58,
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(6),
  //               gradient: const LinearGradient(
  //                 colors: [Color(0x19ffffff), Color(0x19d9d9d9)],
  //                 begin: Alignment.topCenter,
  //                 end: Alignment.bottomCenter,
  //               ),
  //             ),
  //             child: Text(
  //               'This indicates your post rank in your institute',
  //               style: tsWW(12, FontWeight.w600),
  //             ),
  //           ),
  //         );
  //       },
  //     );
  //   }
}
