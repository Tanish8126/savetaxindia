import 'package:flutter/material.dart';

import '../../../utils/constants/constants.dart';
import '../followers/followers.dart';
import '../following/following.dart';

class FollowersScreen extends StatelessWidget {
  static String routeName = './followers_screen';
  const FollowersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        color: kWhite,
        child: SafeArea(
          child: Scaffold(
            appBar: TabBar(
              indicatorWeight: 2,
              indicatorColor: kBlack,
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelStyle: tsCommonW(
                16,
                FontWeight.w700,
                const Color(0xFF272727),
              ),
              labelStyle: tsPW(16, FontWeight.w700),
              tabs: const [
                Tab(text: "Followers"),
                Tab(text: "Following"),
              ],
            ),

            body: const TabBarView(children: [Followers(), Following()]),
          ),
        ),
      ),
    );
  }
}
