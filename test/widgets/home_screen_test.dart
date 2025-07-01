import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:savetaxindia/providers/user_provider.dart';
import '../helpers/test_setup.dart';
import '../helpers/test_widgets.dart';

void main() {
  group('HomeScreen Widget Tests', () {
    setUpAll(() async {
      // Initialize test environment
      await TestSetup.setupFirebaseForTesting();
    });

    testWidgets('should render TestHomeBody with correct structure', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
          child: GetMaterialApp(home: const Scaffold(body: TestHomeBody())),
        ),
      );

      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.byType(Column), findsOneWidget);
    });

    testWidgets('should display top bar with navigation buttons', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
          child: GetMaterialApp(home: const Scaffold(body: TestHomeBody())),
        ),
      );

      // Check for top bar buttons
      expect(find.byType(GestureDetector), findsAtLeastNWidgets(2));
      expect(find.byType(Container), findsAtLeastNWidgets(2));
    });

    testWidgets('should display grid view icon in top bar', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
          child: GetMaterialApp(home: const Scaffold(body: TestHomeBody())),
        ),
      );

      expect(find.byIcon(Icons.grid_view_rounded), findsOneWidget);
    });

    testWidgets('should display notification icon in top bar', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
          child: GetMaterialApp(home: const Scaffold(body: TestHomeBody())),
        ),
      );

      expect(find.byIcon(Icons.notifications_none_rounded), findsOneWidget);
    });

    testWidgets('should display discount banner placeholder', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
          child: GetMaterialApp(home: const Scaffold(body: TestHomeBody())),
        ),
      );

      // Check for Discount Banner placeholder
      expect(find.text('Discount Banner'), findsOneWidget);
    });

    testWidgets('should display categories placeholder', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
          child: GetMaterialApp(home: const Scaffold(body: TestHomeBody())),
        ),
      );

      // Categories placeholder should be present
      expect(find.text('Categories'), findsOneWidget);
    });

    testWidgets('should display prompt field placeholder', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
          child: GetMaterialApp(home: const Scaffold(body: TestHomeBody())),
        ),
      );

      // PromptField placeholder should be present
      expect(find.text('Prompt Field'), findsOneWidget);
    });

    testWidgets('should handle top bar button taps', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
          child: GetMaterialApp(home: const Scaffold(body: TestHomeBody())),
        ),
      );

      // Tap the grid view button
      await tester.tap(find.byIcon(Icons.grid_view_rounded));
      await tester.pump();

      // Tap the notification button
      await tester.tap(find.byIcon(Icons.notifications_none_rounded));
      await tester.pump();
    });

    testWidgets('should have correct padding and layout', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
          child: GetMaterialApp(home: const Scaffold(body: TestHomeBody())),
        ),
      );

      expect(find.byType(Padding), findsAtLeastNWidgets(1));
      expect(find.byType(Row), findsAtLeastNWidgets(1));
    });

    testWidgets('should handle scroll behavior', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
          child: GetMaterialApp(home: const Scaffold(body: TestHomeBody())),
        ),
      );

      // Test scrolling
      await tester.drag(
        find.byType(SingleChildScrollView),
        const Offset(0, -100),
      );
      await tester.pump();
    });

    testWidgets('should handle different screen sizes', (
      WidgetTester tester,
    ) async {
      // Test with different screen sizes
      await tester.binding.setSurfaceSize(const Size(400, 800));

      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
          child: GetMaterialApp(home: const Scaffold(body: TestHomeBody())),
        ),
      );

      expect(find.byType(TestHomeBody), findsOneWidget);
    });
  });
}
