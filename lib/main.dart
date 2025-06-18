import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:savetaxindia/screens/splash-home/first_splash/first_splash.dart';

import 'global.dart';
import 'utils/routes.dart';
import 'utils/theme.dart';

Future<void> main() async {
  await Global.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Save Tax India",
          theme: theme(),
          initialRoute: FirstSplash.routeName,
          routes: routes,
        );
      },
    );
  }
}
