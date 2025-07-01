import 'package:flutter/material.dart';

import '../../../utils/constants/constants.dart';
import '../followers/followers.dart';
import '../following/following.dart';

// FollowersScreen displays tabs for Followers and Following lists.
class FollowersScreen extends StatelessWidget {
  // Route name for navigation
  static String routeName = './followers_screen';
  const FollowersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Two tabs: Followers and Following
      child: Container(
        color: kWhite,
        child: SafeArea(
          child: Scaffold(
            // Tab bar for switching between followers and following
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
            // TabBarView displays the content for each tab
            body: const TabBarView(children: [Followers(), Following()]),
          ),
        ),
      ),
    );
  }
}
