import 'package:flutter/material.dart';

import '../screens/choose_tax_screen/choose_tax_screen.dart';
import '../screens/create_tweet_screen/create_tweet_screen.dart';
import '../screens/discusssion_screen/discussion_screen.dart';
import '../screens/edit_income/edit_income.dart';
import '../screens/edit_profile_screen/edit_profile_screen.dart';
import '../screens/expat_dashboard.dart';
import '../screens/hire_expert_screen/hire_expert_screen.dart';
import '../screens/home/bottom_nav/bottom_nav.dart';
import '../screens/my_account_screen/my_account_screen.dart';
import '../screens/notification_screen/notification_screen.dart';
import '../screens/profile_screen/components/followers_screen.dart';
import '../screens/profile_screen/profile_screen.dart';
import '../screens/push_notification/push_notification.dart';
import '../screens/refund_option.dart';
import '../screens/home/home.dart';
import '../screens/resouces_screen/resouces_screen.dart';
import '../screens/splash-to-home/loading_data/loading_data.dart';
import '../screens/splash-to-home/login_check/login_check.dart';
import '../screens/splash-to-home/splash_screen/splash_screen.dart';
import '../screens/splash-to-home/otp_screen/otp_screen.dart';
import '../screens/splash-to-home/phone_auth_screen/phone_auth_screen.dart';
import '../screens/final_tax_dashboard/final_tax_dashboard.dart';
import '../screens/subscription screen/subscription_screen.dart';
import '../screens/tax_input_screen/tax_input_screen.dart';
import '../screens/tree.my_account/change_language/change_language.dart';
import '../screens/tree.my_account/close_account_screen/close_account_screen.dart';
import '../screens/tree.my_account/refer_friend_screen/refer_friend_screen.dart';
import '../screens/upload_file_screen/upload_file_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  ChangeLanguageScreen.routeName: (context) => ChangeLanguageScreen(),
  ChooseTaxYearScreen.routeName: (context) => ChooseTaxYearScreen(),
  CloseAccountScreen.routeName: (context) => CloseAccountScreen(),
  CreateTweetScreen.routeName: (context) => CreateTweetScreen(),
  DiscussionScreen.routeName: (context) => DiscussionScreen(),
  EditIncomeScreen.routeName: (context) => EditIncomeScreen(),
  EditProfileScreen.routeName: (context) => EditProfileScreen(),
  ExpatFileDashboard.routeName: (context) => ExpatFileDashboard(),
  FollowersScreen.routeName: (context) => FollowersScreen(),
  HireExpertScreen.routeName: (context) => HireExpertScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  UploadFileScreen.routeName: (context) => UploadFileScreen(),
  LoadingData.routeName: (context) => LoadingData(),
  LoginCheck.routeName: (context) => LoginCheck(),
  MainScreen.routeName: (context) => MainScreen(),
  MyAccountScreen.routeName: (context) => MyAccountScreen(),
  NotificationScreen.routeName: (context) => NotificationScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  PhoneAuthScreen.routeName: (context) => PhoneAuthScreen(),
  ProfileScreen.routeName: (context) =>
      ProfileScreen(uid: '', username: '', bio: ''),
  PushNotification.routeName: (context) => PushNotification(),
  ReferFriendScreen.routeName: (context) => ReferFriendScreen(),
  RefundOptionsScreen.routeName: (context) => RefundOptionsScreen(),
  ResoucesScreen.routeName: (context) => ResoucesScreen(),
  SplashScreen.routeName: (context) => SplashScreen(),
  SubscriptionScreen.routeName: (context) => SubscriptionScreen(),
  TaxDashboardScreen.routeName: (context) => TaxDashboardScreen(),
  TaxInputScreen.routeName: (context) => TaxInputScreen(),
};
