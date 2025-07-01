// This file contains global initialization logic for the app, including Firebase and App Check.
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// Global class for app-wide initialization
class Global {
  // Initializes Flutter bindings, Firebase, and App Check
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
    await Firebase.initializeApp(); // Initialize Firebase
    await FirebaseAppCheck.instance.activate(
      androidProvider:
          AndroidProvider.playIntegrity, // Use Play Integrity for Android
    );
  }
}
