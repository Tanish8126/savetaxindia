import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/constants.dart';
import '../loading_data/loading_data.dart';
import '../splash_screen/splash_screen.dart';

class LoginCheck extends StatelessWidget {
  const LoginCheck({super.key});
  static String routeName = "/logincheck";

  @override
  Widget build(BuildContext context) {
    //==================Screen Size Initialization==================
    SizeConfig.init(context);

    //==================Stream Builder=============== ===
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          //==================Main Screen==================
          return LoadingData();
        } else {
          //==================Splash Screen==================
          return const SplashScreen();
        }
      },
    );
  }
}
