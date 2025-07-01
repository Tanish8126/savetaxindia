// This file defines all named routes for the app and maps them to their respective screens.
import 'package:flutter/material.dart';

import '../screens/choose_tax_screen/choose_tax_screen.dart';
import '../screens/tweet_comment/tweet_comment_screen.dart';
import '../screens/create_tweet_screen/create_tweet_screen.dart';
import '../screens/discussion_screen/discussion_screen.dart';
import '../screens/edit_income_screen/edit_income_screen.dart';
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
import '../screens/resources_screen/resources_screen.dart';
import '../screens/splash-to-home/loading_data/loading_data.dart';
import '../screens/splash-to-home/login_check/login_check.dart';
import '../screens/splash-to-home/splash_screen/splash_screen.dart';
import '../screens/splash-to-home/otp_screen/otp_screen.dart';
import '../screens/splash-to-home/phone_auth_screen/phone_auth_screen.dart';
import '../screens/final_tax_dashboard/final_tax_dashboard.dart';
import '../screens/subscription_screen/subscription_screen.dart';
import '../screens/tax_input_screen/tax_input_screen.dart';
import '../screens/tree_my_account/change_language/change_language.dart';
import '../screens/tree_my_account/close_account_screen/close_account_screen.dart';
import '../screens/tree_my_account/refer_friend_screen/refer_friend_screen.dart';
import '../screens/upload_file_screen/upload_file_screen.dart';

// We use named routes for navigation in the app.
// This map links route names to their corresponding screen widgets.
final Map<String, WidgetBuilder> routes = {
  ChangeLanguageScreen.routeName: (context) =>
      ChangeLanguageScreen(), // Change language screen
  ChooseTaxYearScreen.routeName: (context) =>
      ChooseTaxYearScreen(), // Choose tax year
  TweetCommentScreen.routeName: (context) =>
      TweetCommentScreen(), // Comment screen
  CloseAccountScreen.routeName: (context) =>
      CloseAccountScreen(), // Close account
  CreateTweetScreen.routeName: (context) => CreateTweetScreen(), // Create tweet
  DiscussionScreen.routeName: (context) => DiscussionScreen(), // Discussion
  EditIncomeScreen.routeName: (context) => EditIncomeScreen(), // Edit income
  EditProfileScreen.routeName: (context) => EditProfileScreen(), // Edit profile
  ExpatFileDashboard.routeName: (context) =>
      ExpatFileDashboard(), // Expat dashboard
  FollowersScreen.routeName: (context) => FollowersScreen(), // Followers
  HireExpertScreen.routeName: (context) => HireExpertScreen(), // Hire expert
  HomeScreen.routeName: (context) => HomeScreen(), // Home
  UploadFileScreen.routeName: (context) => UploadFileScreen(), // Upload file
  LoadingData.routeName: (context) => LoadingData(), // Loading data
  LoginCheck.routeName: (context) => LoginCheck(), // Login check
  MainScreen.routeName: (context) => MainScreen(), // Main screen
  MyAccountScreen.routeName: (context) => MyAccountScreen(), // My account
  NotificationScreen.routeName: (context) =>
      NotificationScreen(), // Notifications
  OtpScreen.routeName: (context) => OtpScreen(), // OTP screen
  PhoneAuthScreen.routeName: (context) => PhoneAuthScreen(), // Phone auth
  ProfileScreen.routeName: (context) =>
      ProfileScreen(uid: '', username: '', bio: ''), // Profile
  PushNotification.routeName: (context) =>
      PushNotification(), // Push notifications
  ReferFriendScreen.routeName: (context) => ReferFriendScreen(), // Refer friend
  RefundOptionsScreen.routeName: (context) =>
      RefundOptionsScreen(), // Refund options
  ResourcesScreen.routeName: (context) => ResourcesScreen(), // Resources
  SplashScreen.routeName: (context) => SplashScreen(), // Splash screen
  SubscriptionScreen.routeName: (context) =>
      SubscriptionScreen(), // Subscription
  TaxDashboardScreen.routeName: (context) =>
      TaxDashboardScreen(), // Tax dashboard
  TaxInputScreen.routeName: (context) => TaxInputScreen(), // Tax input
};
