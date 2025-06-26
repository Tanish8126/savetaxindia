import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'global.dart';
import 'providers/user_provider.dart';
import 'screens/splash-to-home/login_check/login_check.dart';
import 'utils/routes.dart';
import 'utils/theme.dart';

Future<void> main() async {
  await Global.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //==================Screen Size Initialization==================
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        //==================Get Material App==================
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Save Tax India",
          theme: theme(),
          //==================Initial Route==================
          initialRoute: LoginCheck.routeName,
          //==================Routes==================
          routes: routes,
        );
      },
    );
  }
}
