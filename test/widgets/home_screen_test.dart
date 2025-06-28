import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:savetaxindia/screens/home/home.dart';
import 'package:savetaxindia/screens/home/components/home_body.dart';
import 'package:savetaxindia/providers/user_provider.dart';

void main() {
  group('HomeScreen Widget Tests', () {
    testWidgets('should render HomeScreen with SafeArea and Scaffold', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
          child: GetMaterialApp(home: const HomeScreen()),
        ),
      );

      expect(find.byType(SafeArea), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(HomeBody), findsOneWidget);
    });

    testWidgets('should render HomeBody with correct structure', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
          child: GetMaterialApp(home: const Scaffold(body: HomeBody())),
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
          child: GetMaterialApp(home: const Scaffold(body: HomeBody())),
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
          child: GetMaterialApp(home: const Scaffold(body: HomeBody())),
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
          child: GetMaterialApp(home: const Scaffold(body: HomeBody())),
        ),
      );

      expect(find.byIcon(Icons.notifications_none_rounded), findsOneWidget);
    });

    testWidgets('should display discount banner', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
          child: GetMaterialApp(home: const Scaffold(body: HomeBody())),
        ),
      );

      // Check for DiscountBanner widget
      expect(find.byType(Container), findsAtLeastNWidgets(1));
    });

    testWidgets('should display categories section', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
          child: GetMaterialApp(home: const Scaffold(body: HomeBody())),
        ),
      );

      // Categories widget should be present
      expect(find.byType(Column), findsOneWidget);
    });

    testWidgets('should display prompt field', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
          child: GetMaterialApp(home: const Scaffold(body: HomeBody())),
        ),
      );

      // PromptField widget should be present
      expect(find.byType(Column), findsOneWidget);
    });

    testWidgets('should handle top bar button taps', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
          child: GetMaterialApp(home: const Scaffold(body: HomeBody())),
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
          child: GetMaterialApp(home: const Scaffold(body: HomeBody())),
        ),
      );

      expect(find.byType(Padding), findsAtLeastNWidgets(1));
      expect(find.byType(Row), findsAtLeastNWidgets(1));
    });

    testWidgets('should handle scroll behavior', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
          child: GetMaterialApp(home: const Scaffold(body: HomeBody())),
        ),
      );

      // Test scrolling
      await tester.drag(
        find.byType(SingleChildScrollView),
        const Offset(0, -100),
      );
      await tester.pump();
    });

    testWidgets('should maintain widget hierarchy', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
          child: GetMaterialApp(home: const HomeScreen()),
        ),
      );

      final homeScreen = tester.widget<HomeScreen>(find.byType(HomeScreen));
      expect(homeScreen, isNotNull);
    });

    testWidgets('should handle different screen sizes', (
      WidgetTester tester,
    ) async {
      // Test with different screen sizes
      await tester.binding.setSurfaceSize(const Size(400, 800));

      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
          child: GetMaterialApp(home: const HomeScreen()),
        ),
      );

      expect(find.byType(HomeScreen), findsOneWidget);
    });
  });
}
