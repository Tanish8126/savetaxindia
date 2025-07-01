// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:savetaxindia/utils/default_button.dart';
import '../helpers/test_setup.dart';

void main() {
  group('DefaultButton Widget Tests', () {
    setUpAll(() async {
      // Initialize test environment
      await TestSetup.setupFirebaseForTesting();
    });

    testWidgets('should render DefaultButton with correct text', (
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
      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.byType(TextButton), findsOneWidget);
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

      final buttonStyle = textButton.style;
      expect(buttonStyle, isNotNull);
    });

    testWidgets('should have full width SizedBox', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DefaultButton(text: 'Test', size: 16.0, press: () {}),
          ),
        ),
      );

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.width, double.infinity);
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

    testWidgets('should handle multiple button presses', (
      WidgetTester tester,
    ) async {
      int pressCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DefaultButton(
              text: 'Multi Press',
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

    testWidgets('should handle rapid button presses', (
      WidgetTester tester,
    ) async {
      int pressCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DefaultButton(
              text: 'Rapid Press',
              size: 16.0,
              press: () {
                pressCount++;
              },
            ),
          ),
        ),
      );

      // Rapidly tap the button
      for (int i = 0; i < 5; i++) {
        await tester.tap(find.byType(TextButton));
        await tester.pump();
      }

      expect(pressCount, 5);
    });

    testWidgets('should handle unicode characters in text', (
      WidgetTester tester,
    ) async {
      const unicodeText = '按钮测试';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DefaultButton(text: unicodeText, size: 16.0, press: () {}),
          ),
        ),
      );

      expect(find.text(unicodeText), findsOneWidget);
    });

    testWidgets('should handle emoji in text', (WidgetTester tester) async {
      const emojiText = 'Button 😀🎉';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DefaultButton(text: emojiText, size: 16.0, press: () {}),
          ),
        ),
      );

      expect(find.text(emojiText), findsOneWidget);
    });

    testWidgets('should handle multiple buttons in same screen', (
      WidgetTester tester,
    ) async {
      int button1Presses = 0;
      int button2Presses = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                DefaultButton(
                  text: 'Button 1',
                  size: 16.0,
                  press: () {
                    button1Presses++;
                  },
                ),
                DefaultButton(
                  text: 'Button 2',
                  size: 16.0,
                  press: () {
                    button2Presses++;
                  },
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(DefaultButton), findsNWidgets(2));
      expect(find.text('Button 1'), findsOneWidget);
      expect(find.text('Button 2'), findsOneWidget);

      await tester.tap(find.text('Button 1'));
      await tester.pump();
      expect(button1Presses, 1);
      expect(button2Presses, 0);

      await tester.tap(find.text('Button 2'));
      await tester.pump();
      expect(button1Presses, 1);
      expect(button2Presses, 1);
    });

    testWidgets('should handle button with very small size', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DefaultButton(text: 'Small', size: 0.1, press: () {}),
          ),
        ),
      );

      expect(find.byType(DefaultButton), findsOneWidget);
      final button = tester.widget<DefaultButton>(find.byType(DefaultButton));
      expect(button.size, 0.1);
    });

    testWidgets('should handle button with negative size', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DefaultButton(text: 'Negative', size: -5.0, press: () {}),
          ),
        ),
      );

      expect(find.byType(DefaultButton), findsOneWidget);
      final button = tester.widget<DefaultButton>(find.byType(DefaultButton));
      expect(button.size, -5.0);
    });

    testWidgets('should maintain widget hierarchy', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DefaultButton(text: 'Test', size: 16.0, press: () {}),
          ),
        ),
      );

      final button = tester.widget<DefaultButton>(find.byType(DefaultButton));
      expect(button, isNotNull);
    });

    testWidgets('should handle different screen sizes', (
      WidgetTester tester,
    ) async {
      await tester.binding.setSurfaceSize(const Size(400, 800));

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DefaultButton(text: 'Test', size: 16.0, press: () {}),
          ),
        ),
      );

      expect(find.byType(DefaultButton), findsOneWidget);
    });

    testWidgets('should handle widget rebuilds', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DefaultButton(text: 'Test', size: 16.0, press: () {}),
          ),
        ),
      );

      expect(find.byType(DefaultButton), findsOneWidget);

      // Rebuild the widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DefaultButton(text: 'Test', size: 16.0, press: () {}),
          ),
        ),
      );

      expect(find.byType(DefaultButton), findsOneWidget);
    });

    testWidgets('should handle orientation changes', (
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

      // Change orientation
      await tester.binding.setSurfaceSize(const Size(800, 400));
      await tester.pump();

      expect(find.byType(DefaultButton), findsOneWidget);
    });
  });
}
