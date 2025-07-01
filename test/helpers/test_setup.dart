import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:savetaxindia/providers/user_provider.dart';

class TestSetup {
  static Future<void> setupFirebaseForTesting() async {
    // Mock Firebase initialization for tests
    // This prevents Firebase initialization errors in tests
    TestWidgetsFlutterBinding.ensureInitialized();

    // Initialize ScreenUtil for tests
    await ScreenUtil.ensureScreenSize();
  }

  static Widget createTestApp({
    required Widget child,
    bool useGetMaterialApp = false,
    bool includeUserProvider = false,
  }) {
    Widget appWidget;

    if (useGetMaterialApp) {
      appWidget = GetMaterialApp(
        home: child,
        onUnknownRoute: (settings) {
          // Return a simple placeholder widget for unknown routes
          return MaterialPageRoute(
            builder: (context) => Scaffold(
              body: Center(child: Text('Route not found: ${settings.name}')),
            ),
          );
        },
      );
    } else {
      appWidget = MaterialApp(
        home: child,
        onUnknownRoute: (settings) {
          // Return a simple placeholder widget for unknown routes
          return MaterialPageRoute(
            builder: (context) => Scaffold(
              body: Center(child: Text('Route not found: ${settings.name}')),
            ),
          );
        },
      );
    }

    Widget screenUtilWidget = ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) => appWidget,
      child: child,
    );

    if (includeUserProvider) {
      return ChangeNotifierProvider(
        create: (_) => UserProvider(),
        child: screenUtilWidget,
      );
    } else {
      return screenUtilWidget;
    }
  }
}

// Mock Firebase Firestore for testing
class MockFirebaseFirestore {
  static Future<List<Map<String, dynamic>>> getMockCategories() async {
    // Return mock data instead of real Firebase data
    return [
      {
        'title': 'Income Tax',
        'description': 'Calculate your income tax',
        'icon': 'tax_icon',
      },
      {'title': 'GST', 'description': 'Calculate GST', 'icon': 'gst_icon'},
      {'title': 'TDS', 'description': 'Calculate TDS', 'icon': 'tds_icon'},
    ];
  }
}

// Mock Get.put for testing
class MockGet {
  static T put<T>(T controller) {
    // Return the controller without actually putting it in Get's dependency injection
    return controller;
  }
}
