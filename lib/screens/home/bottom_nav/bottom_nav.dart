import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../providers/user_provider.dart';
import '../../../utils/constants/constants.dart';
import '../../discusssion_screen/discussion_screen.dart';
import '../../profile_screen/profile_screen.dart';
import '../../subscription screen/subscription_screen.dart';
import '../home.dart';

class MainScreen extends StatefulWidget {
  static String routeName = '/mainscreen';
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _page = 0;
  var userData = {};
  List<Widget>? pages;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final uid = Provider.of<UserProvider>(context).user.uid;
    final username = "";
    final bio = "";

    pages = [
      HomeScreen(),
      DiscussionScreen(),
      SubscriptionScreen(),
      ProfileScreen(uid: uid, username: username, bio: bio),
    ];
  }

  void onPageChange(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kPrimary,
        unselectedItemColor: kInactive,
        backgroundColor: kPrimary,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 5,
        unselectedFontSize: 0,
        selectedFontSize: 0,
        onTap: onPageChange,
        currentIndex: _page,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/home.svg",
              colorFilter: ColorFilter.mode(
                _page == 0 ? kWhite : const Color.fromARGB(255, 110, 108, 108),
                BlendMode.srcIn,
              ),
              height: 30.h,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/people.svg",
              colorFilter: ColorFilter.mode(
                _page == 1 ? kWhite : const Color.fromARGB(255, 110, 108, 108),
                BlendMode.srcIn,
              ),
              height: 30.h,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/message.svg",
              colorFilter: ColorFilter.mode(
                _page == 2 ? kWhite : const Color.fromARGB(255, 110, 108, 108),
                BlendMode.srcIn,
              ),
              height: 30.h,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/profile.svg",
              colorFilter: ColorFilter.mode(
                _page == 3 ? kWhite : const Color.fromARGB(255, 110, 108, 108),
                BlendMode.srcIn,
              ),
              height: 30.h,
            ),
            label: "",
          ),
        ],
      ),
      body: pages?[_page],
    );
  }
}
