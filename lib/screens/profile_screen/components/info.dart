import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../providers/user_provider.dart';
import '../../../utils/constants/constants.dart';
import '../../edit_profile_screen/edit_profile_screen.dart';
import 'followers_screen.dart';

class Info extends StatelessWidget {
  const Info({
    super.key,
    required this.username,
    required this.bio,
    required this.uid,
  });

  final String username;
  final String bio;
  final String uid;

  @override
  Widget build(BuildContext context) {
    final currentuid = Provider.of<UserProvider>(context).user.uid;
    final currentusername = Provider.of<UserProvider>(context).user.userName;
    final currentbio = Provider.of<UserProvider>(context).user.bio;

    return Padding(
      padding: pds(0.02, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //==================Edit Profile Button==================
          uid == currentuid
              ? Align(
                  alignment: Alignment.centerRight,
                  child: OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Colors.transparent,
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(EditProfileScreen.routeName);
                    },
                    child: const Text("Edit"),
                  ),
                )
              : const SizedBox.shrink(),
          //==================User Name==================
          Text(
            uid == currentuid
                ? (currentusername == ''
                      ? "Please set your username"
                      : currentusername)
                : username,
            style: tsBW(18, FontWeight.w700),
          ),

          //==================User Bio==================
          sh01,
          Text(
            uid == currentuid
                ? (currentbio == '' ? "Please set your bio" : currentbio)
                : bio,
            style: tsCommonW(
              13,
              FontWeight.w400,
              const Color.fromARGB(255, 0, 0, 0),
            ),
          ),

          UserType(),

          FollowersFollowingRow(),

          //==================Unfollow Button==================
          uid == currentuid
              ? const SizedBox.shrink()
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

class FollowersFollowingRow extends StatelessWidget {
  const FollowersFollowingRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //==================Followers==================
        ShaderMask(
          shaderCallback: (Rect bounds) => const LinearGradient(
            colors: [Color(0xFFAB8DFF), Color(0xFF63D0FF)],
          ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
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
          shaderCallback: (Rect bounds) => const LinearGradient(
            colors: [Color(0xFFAB8DFF), Color(0xFF63D0FF)],
          ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
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
    );
  }
}

class UserType extends StatelessWidget {
  const UserType({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
              style: tsCommonW(15, FontWeight.w700, const Color(0xFFFFA3A3)),
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
            style: tsCommonW(15, FontWeight.w700, const Color(0xFF7059FF)),
          ),
        ),
        sw05,
      ],
    );
  }
}
