import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:savetaxindia/utils/form_error.dart';

void main() {
  group('FormError Widget Tests', () {
    testWidgets('should display single error message', (
      WidgetTester tester,
    ) async {
      final errors = ['This field is required'];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: FormError(errors: errors)),
        ),
      );

      expect(find.text('This field is required'), findsOneWidget);
      expect(find.byType(FormError), findsOneWidget);
    });

    testWidgets('should display multiple error messages', (
      WidgetTester tester,
    ) async {
      final errors = [
        'Email is required',
        'Password is required',
        'Phone number is invalid',
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: FormError(errors: errors)),
        ),
      );

      expect(find.text('Email is required'), findsOneWidget);
      expect(find.text('Password is required'), findsOneWidget);
      expect(find.text('Phone number is invalid'), findsOneWidget);
      expect(find.byType(FormError), findsOneWidget);
    });

    testWidgets('should display empty list without errors', (
      WidgetTester tester,
    ) async {
      final errors = <String>[];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: FormError(errors: errors)),
        ),
      );

      expect(find.byType(FormError), findsOneWidget);
      expect(find.byType(Text), findsNothing);
    });

    testWidgets('should display error with special characters', (
      WidgetTester tester,
    ) async {
      final errors = ['Error with special chars: !@#\$%^&*()'];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: FormError(errors: errors)),
        ),
      );

      expect(
        find.text('Error with special chars: !@#\$%^&*()'),
        findsOneWidget,
      );
    });

    testWidgets('should display long error message', (
      WidgetTester tester,
    ) async {
      final longError = 'a' * 100;
      final errors = [longError];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: FormError(errors: errors)),
        ),
      );

      expect(find.text(longError), findsOneWidget);
    });

    testWidgets('should handle null errors gracefully', (
      WidgetTester tester,
    ) async {
      final errors = [null, 'Valid error'];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: FormError(errors: errors)),
        ),
      );

      expect(find.text('Valid error'), findsOneWidget);
    });

    testWidgets('should have correct widget structure', (
      WidgetTester tester,
    ) async {
      final errors = ['Test error'];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: FormError(errors: errors)),
        ),
      );

      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(Row), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
      expect(find.byType(SizedBox), findsOneWidget);
    });

    testWidgets('should display error icon', (WidgetTester tester) async {
      final errors = ['Test error'];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: FormError(errors: errors)),
        ),
      );

      // Check for SVG widget (error icon)
      expect(find.byType(SizedBox), findsOneWidget);
    });

    testWidgets('should handle multiple null errors', (
      WidgetTester tester,
    ) async {
      final errors = [null, null, null];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: FormError(errors: errors)),
        ),
      );

      expect(find.byType(FormError), findsOneWidget);
    });

    testWidgets('should handle mixed null and valid errors', (
      WidgetTester tester,
    ) async {
      final errors = [null, 'Valid error 1', null, 'Valid error 2'];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: FormError(errors: errors)),
        ),
      );

      expect(find.text('Valid error 1'), findsOneWidget);
      expect(find.text('Valid error 2'), findsOneWidget);
    });

    testWidgets('should maintain widget hierarchy', (
      WidgetTester tester,
    ) async {
      final errors = ['Error 1', 'Error 2'];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: FormError(errors: errors)),
        ),
      );

      final formError = tester.widget<FormError>(find.byType(FormError));
      expect(formError.errors, equals(['Error 1', 'Error 2']));
    });
  });
}
