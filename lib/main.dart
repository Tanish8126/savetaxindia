import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:savetaxindia/screens/home/home.dart';
import 'package:savetaxindia/utils/theme.dart';

import 'utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Save Tax India",
      theme: theme(),
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}
