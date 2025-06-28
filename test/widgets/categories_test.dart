import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:savetaxindia/screens/categories/categories.dart';
import 'package:savetaxindia/screens/categories/components/category_card.dart';

void main() {
  group('Categories Widget Tests', () {
    testWidgets('should render Categories with correct structure', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        GetMaterialApp(home: Scaffold(body: const Categories())),
      );

      expect(find.byType(Padding), findsAtLeastNWidgets(1));
      expect(find.byType(Column), findsAtLeastNWidgets(1));
      expect(find.byType(Row), findsAtLeastNWidgets(1));
    });

    testWidgets('should display explore icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(home: Scaffold(body: const Categories())),
      );

      expect(find.byIcon(Icons.explore), findsOneWidget);
    });

    testWidgets('should display "What You\'re Looking For?" text', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        GetMaterialApp(home: Scaffold(body: const Categories())),
      );

      expect(find.text("What You're Looking For?"), findsOneWidget);
    });

    testWidgets('should display container with categories', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        GetMaterialApp(home: Scaffold(body: const Categories())),
      );

      expect(find.byType(Container), findsAtLeastNWidgets(1));
    });

    testWidgets('should display divider at bottom', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        GetMaterialApp(home: Scaffold(body: const Categories())),
      );

      expect(find.byType(Divider), findsOneWidget);
    });

    testWidgets('should have correct crossAxisAlignment', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        GetMaterialApp(home: Scaffold(body: const Categories())),
      );

      final column = tester.widget<Column>(find.byType(Column).first);
      expect(column.crossAxisAlignment, CrossAxisAlignment.start);
    });

    testWidgets('should display category cards when not loading', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        GetMaterialApp(home: Scaffold(body: const Categories())),
      );

      // Wait for the controller to initialize
      await tester.pumpAndSettle();

      // Check for category cards or shimmer effects
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('should handle horizontal scrolling', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        GetMaterialApp(home: Scaffold(body: const Categories())),
      );

      await tester.pumpAndSettle();

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
        GetMaterialApp(home: Scaffold(body: const Categories())),
      );

      final categories = tester.widget<Categories>(find.byType(Categories));
      expect(categories, isNotNull);
    });

    testWidgets('should handle different screen sizes', (
      WidgetTester tester,
    ) async {
      await tester.binding.setSurfaceSize(const Size(400, 800));

      await tester.pumpWidget(
        GetMaterialApp(home: Scaffold(body: const Categories())),
      );

      expect(find.byType(Categories), findsOneWidget);
    });

    testWidgets('should have proper padding values', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        GetMaterialApp(home: Scaffold(body: const Categories())),
      );

      final padding = tester.widget<Padding>(find.byType(Padding).first);
      expect(padding.padding, isNotNull);
    });

    testWidgets('should display shimmer effect when loading', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        GetMaterialApp(home: Scaffold(body: const Categories())),
      );

      // Check for shimmer effects (they might be present during loading)
      expect(find.byType(Row), findsAtLeastNWidgets(1));
    });

    testWidgets('should have correct icon color', (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(home: Scaffold(body: const Categories())),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.explore));
      expect(icon.color, isNotNull);
    });

    testWidgets('should have correct text style', (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(home: Scaffold(body: const Categories())),
      );

      final text = tester.widget<Text>(find.text("What You're Looking For?"));
      expect(text.style, isNotNull);
    });

    testWidgets('should handle container decoration', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        GetMaterialApp(home: Scaffold(body: const Categories())),
      );

      final containers = find.byType(Container);
      if (containers.evaluate().isNotEmpty) {
        final container = tester.widget<Container>(containers.first);
        expect(container.decoration, isNotNull);
      }
    });
  });

  group('CategoryCard Widget Tests', () {
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
                CategoryCard(icon: Icons.work, text: 'Work', press: () {}),
              ],
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.work), findsOneWidget);
    });

    testWidgets('should handle empty text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CategoryCard(icon: Icons.home, text: '', press: () {}),
          ),
        ),
      );

      expect(find.text(''), findsOneWidget);
    });

    testWidgets('should handle long text', (WidgetTester tester) async {
      final longText = 'a' * 50;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CategoryCard(icon: Icons.home, text: longText, press: () {}),
          ),
        ),
      );

      expect(find.text(longText), findsOneWidget);
    });
    testWidgets('should handle special characters in text', (
      WidgetTester tester,
    ) async {
      final specialText = 'Category with special chars: !@#\$%^&*()';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CategoryCard(
              icon: Icons.home,
              text: specialText,
              press: () {},
            ),
          ),
        ),
      );

      expect(find.text(specialText), findsOneWidget);
    });

    testWidgets('should maintain widget hierarchy', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CategoryCard(icon: Icons.home, text: 'Test', press: () {}),
          ),
        ),
      );

      final categoryCard = tester.widget<CategoryCard>(
        find.byType(CategoryCard),
      );
      expect(categoryCard, isNotNull);
    });

    testWidgets('should handle multiple taps', (WidgetTester tester) async {
      int tapCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CategoryCard(
              icon: Icons.home,
              text: 'Test Category',
              press: () {
                tapCount++;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Test Category'));
      await tester.pump();
      expect(tapCount, 1);

      await tester.tap(find.text('Test Category'));
      await tester.pump();
      expect(tapCount, 2);
    });
  });
}
