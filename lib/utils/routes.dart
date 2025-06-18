import 'package:flutter/material.dart';
import 'package:savetaxindia/screens/splash-home/first_splash/first_splash.dart';
import 'package:savetaxindia/screens/splash-home/otp_screen/otp_screen.dart';

import '../refund_option.dart';
import '../screens/home/home.dart';
import '../screens/splash-home/phone_auth_screen/phone_auth_screen.dart';
import '../tax_summary.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  FirstSplash.routeName: (context) => FirstSplash(),
  PhoneAuthScreen.routeName: (context) => PhoneAuthScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  TaxSummaryScreen.routeName: (context) => TaxSummaryScreen(),
  RefundOptionsScreen.routeName: (context) => RefundOptionsScreen(),
};
