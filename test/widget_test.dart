// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:savetaxindia/main.dart';
import 'package:savetaxindia/providers/user_provider.dart';

void main() {
  group('Main App Widget Tests', () {
    testWidgets('App should start with login check screen', (
      WidgetTester tester,
    ) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
          child: const MyApp(),
        ),
      );

      // Verify that the app starts with the login check screen
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('App should have correct title', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
          child: const MyApp(),
        ),
      );

      // Verify the app title
      expect(find.text('Save Tax India'), findsOneWidget);
    });

    testWidgets('App should not show debug banner', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
          child: const MyApp(),
        ),
      );

      // Verify debug banner is not shown
      expect(find.byType(MaterialApp), findsOneWidget);
      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.debugShowCheckedModeBanner, false);
    });
  });
}
