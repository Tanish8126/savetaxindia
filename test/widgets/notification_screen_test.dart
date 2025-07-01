import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:savetaxindia/screens/notification_screen/notification_screen.dart';
import '../helpers/test_setup.dart';

void main() {
  group('NotificationScreen Widget Tests', () {
    setUpAll(() async {
      // Initialize test environment
      await TestSetup.setupFirebaseForTesting();
    });

    testWidgets('should render NotificationScreen with correct structure', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const NotificationScreen()));

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('should display app bar with correct title', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const NotificationScreen()));

      expect(find.text('Notifications'), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('should display notification cards', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const NotificationScreen()));

      expect(find.byType(Card), findsNWidgets(3));
      expect(find.byType(ListTile), findsNWidgets(3));
    });

    testWidgets('should display like notification with correct icon', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const NotificationScreen()));

      expect(find.byIcon(Icons.favorite), findsOneWidget);
      expect(find.text('New Like'), findsOneWidget);
      expect(find.text('Someone liked your post.'), findsOneWidget);
    });

    testWidgets('should display comment notification with correct icon', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const NotificationScreen()));

      expect(find.byIcon(Icons.comment), findsOneWidget);
      expect(find.text('New Comment'), findsOneWidget);
      expect(find.text('You have a new comment.'), findsOneWidget);
    });

    testWidgets('should display follow notification with correct icon', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const NotificationScreen()));

      expect(find.byIcon(Icons.person_add), findsOneWidget);
      expect(find.text('New Follower'), findsOneWidget);
      expect(find.text('You have a new follower!'), findsOneWidget);
    });

    testWidgets('should display time ago text', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: const NotificationScreen()));

      // Check for time ago text patterns
      expect(find.textContaining('ago'), findsNWidgets(3));
    });

    testWidgets('should have correct card styling', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const NotificationScreen()));

      final cards = find.byType(Card);
      expect(cards, findsNWidgets(3));

      final firstCard = tester.widget<Card>(cards.first);
      expect(firstCard.elevation, 2);
    });

    testWidgets('should have correct list tile structure', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const NotificationScreen()));

      final listTiles = find.byType(ListTile);
      expect(listTiles, findsNWidgets(3));
      for (int i = 0; i < listTiles.evaluate().length; i++) {
        final tile = tester.widget<ListTile>(listTiles.at(i));
        expect(tile.leading, isNotNull);
        expect(tile.title, isNotNull);
        expect(tile.subtitle, isNotNull);
        expect(tile.trailing, isNotNull);
      }
    });

    testWidgets('should handle scroll behavior', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: const NotificationScreen()));

      await tester.drag(find.byType(ListView), const Offset(0, -100));
      await tester.pump();
    });

    testWidgets('should maintain widget hierarchy', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const NotificationScreen()));

      final notificationScreen = tester.widget<NotificationScreen>(
        find.byType(NotificationScreen),
      );
      expect(notificationScreen, isNotNull);
    });

    testWidgets('should handle different screen sizes', (
      WidgetTester tester,
    ) async {
      await tester.binding.setSurfaceSize(const Size(400, 800));

      await tester.pumpWidget(MaterialApp(home: const NotificationScreen()));

      expect(find.byType(NotificationScreen), findsOneWidget);
    });

    testWidgets('should have correct route name', (WidgetTester tester) async {
      expect(NotificationScreen.routeName, '/notification_screen');
    });

    testWidgets('should display correct number of notifications', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const NotificationScreen()));

      expect(find.byType(Card), findsNWidgets(3));
      expect(find.byType(ListTile), findsNWidgets(3));
    });

    testWidgets('should have proper padding', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: const NotificationScreen()));

      final listView = tester.widget<ListView>(find.byType(ListView));
      expect(
        listView.padding,
        const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      );
    });

    testWidgets('should have separators between notifications', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const NotificationScreen()));

      expect(find.byType(SizedBox), findsAtLeastNWidgets(3));
    });

    testWidgets('should handle icon colors correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const NotificationScreen()));

      final likeIcon = tester.widget<Icon>(find.byIcon(Icons.favorite));
      expect(likeIcon.color, Colors.red);

      final commentIcon = tester.widget<Icon>(find.byIcon(Icons.comment));
      expect(commentIcon.color, Colors.blue);

      final followIcon = tester.widget<Icon>(find.byIcon(Icons.person_add));
      expect(followIcon.color, Colors.green);
    });

    testWidgets('should handle app bar center title', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const NotificationScreen()));

      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.centerTitle, true);
    });

    testWidgets('should handle card border radius', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const NotificationScreen()));

      final cards = find.byType(Card);
      final firstCard = tester.widget<Card>(cards.first);
      final shape = firstCard.shape as RoundedRectangleBorder;
      expect(shape.borderRadius, BorderRadius.circular(12));
    });

    testWidgets('should handle notification data correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const NotificationScreen()));

      // Check that all notification titles are displayed
      expect(find.text('New Like'), findsOneWidget);
      expect(find.text('New Comment'), findsOneWidget);
      expect(find.text('New Follower'), findsOneWidget);
    });

    testWidgets('should handle notification descriptions correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const NotificationScreen()));

      // Check that all notification descriptions are displayed
      expect(find.text('Someone liked your post.'), findsOneWidget);
      expect(find.text('You have a new comment.'), findsOneWidget);
      expect(find.text('You have a new follower!'), findsOneWidget);
    });

    testWidgets('should handle time ago formatting', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const NotificationScreen()));

      // Check that time ago text is present for all notifications
      final timeAgoTexts = find.textContaining('ago');
      expect(timeAgoTexts, findsNWidgets(3));
    });

    testWidgets('should have consistent card elevation', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const NotificationScreen()));

      final cards = find.byType(Card);
      for (int i = 0; i < cards.evaluate().length; i++) {
        final card = tester.widget<Card>(cards.at(i));
        expect(card.elevation, 2);
      }
    });

    testWidgets('should have consistent card shape', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const NotificationScreen()));

      final cards = find.byType(Card);
      for (int i = 0; i < cards.evaluate().length; i++) {
        final card = tester.widget<Card>(cards.at(i));
        final shape = card.shape as RoundedRectangleBorder;
        expect(shape.borderRadius, BorderRadius.circular(12));
      }
    });
  });
}
