import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/constants/constants.dart';
import '../create_tweet_screen/create_tweet_screen.dart';
import 'components/discussion_body.dart';

class DiscussionScreen extends StatelessWidget {
  static String routeName = '/discussion_screen';
  const DiscussionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Discussion'), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(CreateTweetScreen.routeName);
        },
        backgroundColor: ktrans,
        child: SvgPicture.asset("assets/icons/floating.svg", height: 60.h),
      ),
      body: const DiscussionScreenBody(),
    );
  }
}
