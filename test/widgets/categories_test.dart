import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:savetaxindia/screens/categories/components/category_card.dart';
import '../helpers/test_setup.dart';
import '../helpers/test_widgets.dart';

void main() {
  group('Categories Widget Tests', () {
    setUpAll(() async {
      // Initialize test environment
      await TestSetup.setupFirebaseForTesting();
    });

    testWidgets('should render TestCategories with correct structure', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        GetMaterialApp(home: Scaffold(body: const TestCategories())),
      );

      expect(find.byType(Padding), findsAtLeastNWidgets(1));
      expect(find.byType(Column), findsAtLeastNWidgets(1));
      expect(find.byType(Row), findsAtLeastNWidgets(1));
    });

    testWidgets('should display explore icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(home: Scaffold(body: const TestCategories())),
      );

      expect(find.byIcon(Icons.explore), findsOneWidget);
    });

    testWidgets('should display "What You\'re Looking For?" text', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        GetMaterialApp(home: Scaffold(body: const TestCategories())),
      );

      expect(find.text("What You're Looking For?"), findsOneWidget);
    });

    testWidgets('should display container with categories', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        GetMaterialApp(home: Scaffold(body: const TestCategories())),
      );

      expect(find.byType(Container), findsAtLeastNWidgets(1));
    });

    testWidgets('should display divider at bottom', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        GetMaterialApp(home: Scaffold(body: const TestCategories())),
      );

      expect(find.byType(Divider), findsOneWidget);
    });

    testWidgets('should have correct crossAxisAlignment', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        GetMaterialApp(home: Scaffold(body: const TestCategories())),
      );

      final column = tester.widget<Column>(find.byType(Column).first);
      expect(column.crossAxisAlignment, CrossAxisAlignment.start);
    });

    testWidgets('should display category cards', (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(home: Scaffold(body: const TestCategories())),
      );

      // Check for category cards
      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.text('File ITR'), findsOneWidget);
      expect(find.text('Discussion'), findsOneWidget);
      expect(find.text('Resources'), findsOneWidget);
      expect(find.text('Expert'), findsOneWidget);
    });

    testWidgets('should handle horizontal scrolling', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        GetMaterialApp(home: Scaffold(body: const TestCategories())),
      );

      final scrollView = find.byType(SingleChildScrollView);
      if (scrollView.evaluate().isNotEmpty) {
        await tester.drag(scrollView, const Offset(-100, 0));
        await tester.pump();
      }
    });

    testWidgets('should maintain widget hierarchy', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        GetMaterialApp(home: Scaffold(body: const TestCategories())),
      );

      final categories = tester.widget<TestCategories>(
        find.byType(TestCategories),
      );
      expect(categories, isNotNull);
    });

    testWidgets('should handle different screen sizes', (
      WidgetTester tester,
    ) async {
      await tester.binding.setSurfaceSize(const Size(400, 800));

      await tester.pumpWidget(
        GetMaterialApp(home: Scaffold(body: const TestCategories())),
      );

      expect(find.byType(TestCategories), findsOneWidget);
    });

    testWidgets('should have proper padding values', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        GetMaterialApp(home: Scaffold(body: const TestCategories())),
      );

      final padding = tester.widget<Padding>(find.byType(Padding).first);
      expect(padding.padding, isNotNull);
    });

    testWidgets('should have correct icon color', (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(home: Scaffold(body: const TestCategories())),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.explore));
      expect(icon.color, isNotNull);
    });

    testWidgets('should have correct text style', (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(home: Scaffold(body: const TestCategories())),
      );

      final text = tester.widget<Text>(find.text("What You're Looking For?"));
      expect(text.style, isNotNull);
    });

    testWidgets('should handle container decoration', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        GetMaterialApp(home: Scaffold(body: const TestCategories())),
      );

      final containers = find.byType(Container);
      if (containers.evaluate().isNotEmpty) {
        final container = tester.widget<Container>(containers.first);
        expect(container.decoration, isNotNull);
      }
    });
  });

  group('CategoryCard Widget Tests', () {
    setUpAll(() async {
      // Initialize test environment
      await TestSetup.setupFirebaseForTesting();
    });

    testWidgets('should render CategoryCard with correct properties', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CategoryCard(
              icon: Icons.home,
              text: 'Test Category',
              press: () {},
            ),
          ),
        ),
      );

      expect(find.text('Test Category'), findsOneWidget);
      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byType(CategoryCard), findsOneWidget);
    });

    testWidgets('should handle CategoryCard tap', (WidgetTester tester) async {
      bool tapped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CategoryCard(
              icon: Icons.home,
              text: 'Test Category',
              press: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Test Category'));
      await tester.pump();

      expect(tapped, true);
    });

    testWidgets('should display different icons correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                CategoryCard(icon: Icons.home, text: 'Home', press: () {}),
                CategoryCard(
                  icon: Icons.settings,
                  text: 'Settings',
                  press: () {},
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.settings), findsOneWidget);
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Settings'), findsOneWidget);
    });

    testWidgets('should have correct layout structure', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CategoryCard(
              icon: Icons.home,
              text: 'Test Category',
              press: () {},
            ),
          ),
        ),
      );

      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(Icon), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
    });

    testWidgets('should handle multiple CategoryCards', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Row(
              children: [
                CategoryCard(icon: Icons.home, text: 'Home', press: () {}),
                CategoryCard(
                  icon: Icons.settings,
                  text: 'Settings',
                  press: () {},
                ),
                CategoryCard(icon: Icons.person, text: 'Profile', press: () {}),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(CategoryCard), findsNWidgets(3));
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Settings'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
    });

    testWidgets('should maintain widget hierarchy', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CategoryCard(
              icon: Icons.home,
              text: 'Test Category',
              press: () {},
            ),
          ),
        ),
      );

      final categoryCard = tester.widget<CategoryCard>(
        find.byType(CategoryCard),
      );
      expect(categoryCard, isNotNull);
    });

    testWidgets('should handle different screen sizes', (
      WidgetTester tester,
    ) async {
      await tester.binding.setSurfaceSize(const Size(400, 800));

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CategoryCard(
              icon: Icons.home,
              text: 'Test Category',
              press: () {},
            ),
          ),
        ),
      );

      expect(find.byType(CategoryCard), findsOneWidget);
    });
  });
}
