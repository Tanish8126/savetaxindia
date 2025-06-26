// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/formdata_model.dart';
import '../../../providers/user_provider.dart';
import '../../../resources/auth_methods.dart';
import '../../home/bottom_nav/bottom_nav.dart';
import '../splash_screen/splash_screen.dart';

class LoadingData extends StatelessWidget {
  static const routeName = '/loading-data';
  const LoadingData({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthMethods()
          .getCurrentUser(FirebaseAuth.instance.currentUser?.uid)
          .then((value) {
            if (value != null) {
              Provider.of<UserProvider>(
                context,
                listen: false,
              ).setUser(SignUpFormData.fromMap(value));
            }
            return value;
          }),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasData) {
          return MainScreen();
        } else {
          return SplashScreen();
        }
      },
    );
  }
}
