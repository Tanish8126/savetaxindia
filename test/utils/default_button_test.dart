// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:savetaxindia/utils/default_button.dart';

void main() {
  group('DefaultButton Widget Tests', () {
    testWidgets('should display button with correct text', (
      WidgetTester tester,
    ) async {
      bool pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DefaultButton(
              text: 'Test Button',
              size: 16.0,
              press: () {
                pressed = true;
              },
            ),
          ),
        ),
      );

      expect(find.text('Test Button'), findsOneWidget);
      expect(find.byType(DefaultButton), findsOneWidget);
    });

    testWidgets('should call press function when tapped', (
      WidgetTester tester,
    ) async {
      bool pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DefaultButton(
              text: 'Tap Me',
              size: 16.0,
              press: () {
                pressed = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(TextButton));
      await tester.pump();

      expect(pressed, true);
    });

    testWidgets('should have correct button structure', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DefaultButton(text: 'Test', size: 16.0, press: () {}),
          ),
        ),
      );

      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.byType(TextButton), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
    });

    testWidgets('should handle empty text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DefaultButton(text: '', size: 16.0, press: () {}),
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
            body: DefaultButton(text: longText, size: 16.0, press: () {}),
          ),
        ),
      );

      expect(find.text(longText), findsOneWidget);
    });

    testWidgets('should handle special characters in text', (
      WidgetTester tester,
    ) async {
      final specialText = 'Button with special chars: !@#\$%^&*()';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DefaultButton(text: specialText, size: 16.0, press: () {}),
          ),
        ),
      );

      expect(find.text(specialText), findsOneWidget);
    });

    testWidgets('should handle different text sizes', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DefaultButton(text: 'Test', size: 20.0, press: () {}),
          ),
        ),
      );

      expect(find.byType(DefaultButton), findsOneWidget);
      final button = tester.widget<DefaultButton>(find.byType(DefaultButton));
      expect(button.size, 20.0);
    });

    testWidgets('should handle zero size', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DefaultButton(text: 'Test', size: 0.0, press: () {}),
          ),
        ),
      );

      expect(find.byType(DefaultButton), findsOneWidget);
      final button = tester.widget<DefaultButton>(find.byType(DefaultButton));
      expect(button.size, 0.0);
    });

    testWidgets('should handle large size', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DefaultButton(text: 'Test', size: 100.0, press: () {}),
          ),
        ),
      );

      expect(find.byType(DefaultButton), findsOneWidget);
      final button = tester.widget<DefaultButton>(find.byType(DefaultButton));
      expect(button.size, 100.0);
    });

    testWidgets('should handle null press function', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DefaultButton(text: 'Test', size: 16.0, press: () {}),
          ),
        ),
      );

      expect(find.byType(DefaultButton), findsOneWidget);
    });

    testWidgets('should maintain button properties', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DefaultButton(text: 'Test Button', size: 18.0, press: () {}),
          ),
        ),
      );

      final button = tester.widget<DefaultButton>(find.byType(DefaultButton));
      expect(button.text, 'Test Button');
      expect(button.size, 18.0);
    });

    testWidgets('should have correct button styling', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DefaultButton(text: 'Test', size: 16.0, press: () {}),
          ),
        ),
      );

      final textButton = tester.widget<TextButton>(find.byType(TextButton));
      expect(textButton, isNotNull);
    });

    testWidgets('should handle multiple button presses', (
      WidgetTester tester,
    ) async {
      int pressCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DefaultButton(
              text: 'Press Me',
              size: 16.0,
              press: () {
                pressCount++;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(TextButton));
      await tester.pump();
      expect(pressCount, 1);

      await tester.tap(find.byType(TextButton));
      await tester.pump();
      expect(pressCount, 2);
    });

    testWidgets('should handle button with numbers in text', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DefaultButton(text: 'Button 123', size: 16.0, press: () {}),
          ),
        ),
      );

      expect(find.text('Button 123'), findsOneWidget);
    });

    testWidgets('should handle button with spaces in text', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DefaultButton(
              text: 'Button with spaces',
              size: 16.0,
              press: () {},
            ),
          ),
        ),
      );

      expect(find.text('Button with spaces'), findsOneWidget);
    });
  });
}
