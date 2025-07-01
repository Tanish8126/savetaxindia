// Main entry point for the Save Tax India Flutter application.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'global.dart';
import 'providers/user_provider.dart';
import 'screens/splash-to-home/login_check/login_check.dart';
import 'utils/constants/constants.dart';
import 'utils/routes.dart';
import 'utils/theme.dart';

// The main function initializes global settings and runs the app.
Future<void> main() async {
  await Global.init(); // Initialize Firebase and other global services
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Lock orientation to portrait up
    DeviceOrientation.portraitDown, // Lock orientation to portrait down
  ]);
  runApp(
    // MultiProvider allows for multiple providers in the widget tree
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ], // User state management
      child: const MyApp(), // Root widget
    ),
  );
}

// Root widget for the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //==================Screen Size Initialization==================
    SizeConfig.init(context); // Initialize screen size configuration

    //==================Screen Size Initialization==================
    return ScreenUtilInit(
      designSize: const Size(360, 690), // Design reference size
      minTextAdapt: true, // Adapt text size for small screens
      splitScreenMode: true, // Support split screen
      builder: (context, child) {
        //==================Get Material App==================
        return GetMaterialApp(
          debugShowCheckedModeBanner: false, // Hide debug banner
          title: "Save Tax India", // App title
          theme: theme(), // App theme
          //==================Initial Route==================
          initialRoute: LoginCheck.routeName, // First screen to show
          //==================Routes==================
          routes: routes, // All named routes
        );
      },
    );
  }
}
