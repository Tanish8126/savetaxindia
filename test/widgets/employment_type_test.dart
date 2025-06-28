import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:savetaxindia/screens/employment_type/employment_type.dart';
import 'package:savetaxindia/screens/employment_type/components/selector.dart';

void main() {
  group('EmploymentType Widget Tests', () {
    testWidgets('should render EmploymentType with correct structure', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: const EmploymentType())),
      );

      expect(find.byType(Row), findsAtLeastNWidgets(1));
      expect(find.byType(Container), findsOneWidget);
      expect(find.byType(Padding), findsOneWidget);
    });

    testWidgets('should display all three employment type selectors', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: const EmploymentType())),
      );

      expect(find.byType(Selector), findsNWidgets(3));
    });

    testWidgets('should display Government employment type', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: const EmploymentType())),
      );

      expect(find.text('Government'), findsOneWidget);
    });

    testWidgets('should display Private employment type', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: const EmploymentType())),
      );

      expect(find.text('Private'), findsOneWidget);
    });

    testWidgets('should display PSU employment type', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: const EmploymentType())),
      );

      expect(find.text('PSU'), findsOneWidget);
    });

    testWidgets('should have correct mainAxisAlignment', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: const EmploymentType())),
      );

      final row = tester.widget<Row>(find.byType(Row).first);
      expect(row.mainAxisAlignment, MainAxisAlignment.spaceAround);
    });

    testWidgets('should have container with correct decoration', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: const EmploymentType())),
      );

      final container = tester.widget<Container>(find.byType(Container));
      expect(container.decoration, isNotNull);
    });

    testWidgets('should handle selector taps', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: const EmploymentType())),
      );

      // Tap on Government selector
      await tester.tap(find.text('Government'));
      await tester.pump();

      // Tap on Private selector
      await tester.tap(find.text('Private'));
      await tester.pump();

      // Tap on PSU selector
      await tester.tap(find.text('PSU'));
      await tester.pump();
    });

    testWidgets('should maintain widget hierarchy', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: const EmploymentType())),
      );

      final employmentType = tester.widget<EmploymentType>(
        find.byType(EmploymentType),
      );
      expect(employmentType, isNotNull);
    });

    testWidgets('should have correct number of children in main row', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: const EmploymentType())),
      );

      final row = tester.widget<Row>(find.byType(Row).first);
      expect(row.children.length, 1); // One container
    });

    testWidgets('should have correct number of selectors in inner row', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: const EmploymentType())),
      );

      final selectors = find.byType(Selector);
      expect(selectors, findsNWidgets(3));
    });

    testWidgets('should handle different screen sizes', (
      WidgetTester tester,
    ) async {
      await tester.binding.setSurfaceSize(const Size(400, 800));

      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: const EmploymentType())),
      );

      expect(find.byType(EmploymentType), findsOneWidget);
    });

    testWidgets('should have proper padding', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: const EmploymentType())),
      );

      final padding = tester.widget<Padding>(find.byType(Padding));
      expect(padding.padding, isNotNull);
    });

    testWidgets('should display selectors in correct order', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: const EmploymentType())),
      );

      final selectors = find.byType(Selector);
      expect(selectors, findsNWidgets(3));

      // Check that all three employment types are present
      expect(find.text('Government'), findsOneWidget);
      expect(find.text('Private'), findsOneWidget);
      expect(find.text('PSU'), findsOneWidget);
    });

    testWidgets('should handle rapid selector taps', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: const EmploymentType())),
      );

      // Rapidly tap different selectors
      await tester.tap(find.text('Government'));
      await tester.pump();

      await tester.tap(find.text('Private'));
      await tester.pump();

      await tester.tap(find.text('PSU'));
      await tester.pump();

      await tester.tap(find.text('Government'));
      await tester.pump();
    });
  });

  group('Selector Widget Tests', () {
    testWidgets('should render Selector with correct properties', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Selector(
              onTap: '/test-route',
              title: 'Test Title',
              value: 'test-value',
            ),
          ),
        ),
      );

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.byType(Selector), findsOneWidget);
    });

    testWidgets('should handle Selector tap', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Selector(
              onTap: '/test-route',
              title: 'Test Title',
              value: 'test-value',
            ),
          ),
        ),
      );

      await tester.tap(find.text('Test Title'));
      await tester.pump();
    });

    testWidgets('should display different titles correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                Selector(onTap: '/route1', title: 'Title 1', value: 'value1'),
                Selector(onTap: '/route2', title: 'Title 2', value: 'value2'),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Title 1'), findsOneWidget);
      expect(find.text('Title 2'), findsOneWidget);
    });
  });
}
