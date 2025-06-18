import 'package:flutter/material.dart';

class Global {
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp();
    //await FirebaseAppCheck.instance.activate(
    // androidProvider: AndroidProvider.playIntegrity,
    //);
  }
}
