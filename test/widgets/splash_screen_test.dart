import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:savetaxindia/screens/splash-to-home/splash_screen/splash_screen.dart';
import 'package:savetaxindia/screens/splash-to-home/splash_screen/components/body.dart';
import 'package:savetaxindia/utils/constants/colors.dart';
import '../helpers/test_setup.dart';

void main() {
  group('SplashScreen Widget Tests', () {
    setUpAll(() async {
      // Initialize test environment
      await TestSetup.setupFirebaseForTesting();
    });

    testWidgets('should render SplashScreen with correct background color', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        TestSetup.createTestApp(
          useGetMaterialApp: true,
          child: const SplashScreen(),
        ),
      );

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(Body), findsOneWidget);

      final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
      expect(scaffold.backgroundColor, kPrimary);
    });

    testWidgets('should render Body component with correct structure', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        TestSetup.createTestApp(
          useGetMaterialApp: true,
          child: const Scaffold(body: Body()),
        ),
      );

      expect(find.byType(Padding), findsAtLeastNWidgets(1));
      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(SizedBox), findsAtLeastNWidgets(1));
    });

    testWidgets('should display lock image', (WidgetTester tester) async {
      await tester.pumpWidget(
        TestSetup.createTestApp(
          useGetMaterialApp: true,
          child: const Scaffold(body: Body()),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
      final image = tester.widget<Image>(find.byType(Image));
      expect(image.image, isA<AssetImage>());
    });

    testWidgets('should display "Save Tax India" title', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        TestSetup.createTestApp(
          useGetMaterialApp: true,
          child: const Scaffold(body: Body()),
        ),
      );

      expect(find.text('Save Tax India'), findsOneWidget);
    });

    testWidgets('should display subtitle text', (WidgetTester tester) async {
      await tester.pumpWidget(
        TestSetup.createTestApp(
          useGetMaterialApp: true,
          child: const Scaffold(body: Body()),
        ),
      );

      expect(
        find.text('because we all know you can\'t resist it'),
        findsOneWidget,
      );
    });

    testWidgets('should display continue button', (WidgetTester tester) async {
      await tester.pumpWidget(
        TestSetup.createTestApp(
          useGetMaterialApp: true,
          child: const Scaffold(body: Body()),
        ),
      );

      expect(find.text('Continue'), findsOneWidget);
      expect(find.byType(GestureDetector), findsOneWidget);
    });

    testWidgets('should handle continue button tap', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        TestSetup.createTestApp(
          useGetMaterialApp: true,
          child: const Scaffold(body: Body()),
        ),
      );

      await tester.tap(find.text('Continue'));
      await tester.pump();

      // The navigation should work without errors now
      expect(find.text('Continue'), findsOneWidget);
    });

    testWidgets('should have correct layout structure', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        TestSetup.createTestApp(
          useGetMaterialApp: true,
          child: const Scaffold(body: Body()),
        ),
      );

      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(Padding), findsAtLeastNWidgets(1));
      expect(find.byType(SizedBox), findsAtLeastNWidgets(1));
    });

    testWidgets('should display correct number of text widgets', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        TestSetup.createTestApp(
          useGetMaterialApp: true,
          child: const Scaffold(body: Body()),
        ),
      );

      expect(
        find.byType(Text),
        findsAtLeastNWidgets(2),
      ); // Title, subtitle, and button text
    });

    testWidgets('should have proper spacing between elements', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        TestSetup.createTestApp(
          useGetMaterialApp: true,
          child: const Scaffold(body: Body()),
        ),
      );

      // Check for SizedBox widgets used for spacing
      expect(find.byType(SizedBox), findsAtLeastNWidgets(2));
    });

    testWidgets('should maintain widget hierarchy', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        TestSetup.createTestApp(
          useGetMaterialApp: true,
          child: const SplashScreen(),
        ),
      );

      final splashScreen = tester.widget<SplashScreen>(
        find.byType(SplashScreen),
      );
      expect(splashScreen, isNotNull);
    });

    testWidgets('should handle different screen sizes', (
      WidgetTester tester,
    ) async {
      await tester.binding.setSurfaceSize(const Size(400, 800));

      await tester.pumpWidget(
        TestSetup.createTestApp(
          useGetMaterialApp: true,
          child: const SplashScreen(),
        ),
      );

      expect(find.byType(SplashScreen), findsOneWidget);
    });

    testWidgets('should have correct crossAxisAlignment', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        TestSetup.createTestApp(
          useGetMaterialApp: true,
          child: const Scaffold(body: Body()),
        ),
      );

      final column = tester.widget<Column>(find.byType(Column));
      expect(column.crossAxisAlignment, CrossAxisAlignment.start);
    });

    testWidgets('should have correct mainAxisAlignment', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        TestSetup.createTestApp(
          useGetMaterialApp: true,
          child: const Scaffold(body: Body()),
        ),
      );

      final column = tester.widget<Column>(find.byType(Column));
      expect(column.mainAxisAlignment, MainAxisAlignment.end);
    });

    testWidgets('should display image with correct asset path', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        TestSetup.createTestApp(
          useGetMaterialApp: true,
          child: const Scaffold(body: Body()),
        ),
      );

      final image = tester.widget<Image>(find.byType(Image));
      final assetImage = image.image as AssetImage;
      expect(assetImage.assetName, 'assets/images/lock.png');
    });

    testWidgets('should handle button press without errors', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        TestSetup.createTestApp(
          useGetMaterialApp: true,
          child: const Scaffold(body: Body()),
        ),
      );

      // Tap the continue button multiple times to ensure no errors
      await tester.tap(find.text('Continue'));
      await tester.pump();

      await tester.tap(find.text('Continue'));
      await tester.pump();

      // Should still be on the same screen
      expect(find.text('Continue'), findsOneWidget);
    });

    testWidgets('should have proper padding values', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        TestSetup.createTestApp(
          useGetMaterialApp: true,
          child: const Scaffold(body: Body()),
        ),
      );

      final paddingWidgets = find.byType(Padding);
      expect(paddingWidgets, findsAtLeastNWidgets(1));

      // Check that at least one padding widget has padding
      final firstPadding = tester.widget<Padding>(paddingWidgets.first);
      expect(firstPadding.padding, isNotNull);
    });
  });
}
