import 'package:flutter/material.dart';
import 'package:savetaxindia/screens/profile_screen/profile_screen.dart';

import '../screens/discussion_screen.dart';
import '../screens/expat_dashboard.dart';
import '../screens/home/bottom_nav/bottom_nav.dart';
import '../screens/notification_screen/notification_screen.dart';
import '../screens/profile_screen/components/editprofile_screen.dart';
import '../screens/profile_screen/components/followers_screen.dart';
import '../screens/push_notification/push_notification.dart';
import '../screens/refund_option.dart';
import '../screens/home/home.dart';
import '../screens/splash-home/login_check/login_check.dart';
import '../screens/splash-home/splash_screen/splash_screen.dart';
import '../screens/splash-home/otp_screen/otp_screen.dart';
import '../screens/splash-home/phone_auth_screen/phone_auth_screen.dart';
import '../screens/final_tax_dashboard/final_tax_dashboard.dart';
import '../screens/subscription screen/subscription_screen.dart';
import '../screens/tax_input/tax_input.dart';
import '../screens/tax_summary.dart';
import '../screens/upload_file_screen/upload_file_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  DiscussionScreen.routeName: (context) => DiscussionScreen(),
  EditProfileScreen.routeName: (context) => EditProfileScreen(),
  ExpatFileDashboard.routeName: (context) => ExpatFileDashboard(),
  FollowersScreen.routeName: (context) => FollowersScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  UploadFileScreen.routeName: (context) => UploadFileScreen(),
  LoginCheck.routeName: (context) => LoginCheck(),
  MainScreen.routeName: (context) => MainScreen(),
  NotificationScreen.routeName: (context) => NotificationScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  PhoneAuthScreen.routeName: (context) => PhoneAuthScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  PushNotification.routeName: (context) => PushNotification(),
  RefundOptionsScreen.routeName: (context) => RefundOptionsScreen(),
  SplashScreen.routeName: (context) => SplashScreen(),
  SubscriptionScreen.routeName: (context) => SubscriptionScreen(),
  TaxDashboardScreen.routeName: (context) => TaxDashboardScreen(),
  TaxInput.routeName: (context) => TaxInput(),
  TaxSummaryScreen.routeName: (context) => TaxSummaryScreen(),
};
