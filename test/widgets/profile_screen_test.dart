import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:savetaxindia/screens/profile_screen/profile_screen.dart';
import 'package:savetaxindia/screens/profile_screen/components/profile_body.dart';
import '../helpers/test_setup.dart';
import 'package:provider/provider.dart';
import 'package:savetaxindia/providers/user_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  group('ProfileScreen Widget Tests', () {
    setUpAll(() async {
      // Initialize test environment
      await TestSetup.setupFirebaseForTesting();
    });

    const testUid = 'test-uid-123';
    const testUsername = 'testuser';
    const testBio = 'This is a test bio';

    testWidgets('should render ProfileScreen with correct structure', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
          child: ScreenUtilInit(
            designSize: const Size(360, 690),
            builder: (context, _) => MaterialApp(
              home: TestSetup.createTestApp(
                includeUserProvider: true,
                child: const ProfileScreen(
                  uid: testUid,
                  username: testUsername,
                  bio: testBio,
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(ProfileScreenBody), findsOneWidget);
    });

    testWidgets('should pass correct props to ProfileScreenBody', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
          child: ScreenUtilInit(
            designSize: const Size(360, 690),
            builder: (context, _) => MaterialApp(
              home: TestSetup.createTestApp(
                includeUserProvider: true,
                child: const ProfileScreen(
                  uid: testUid,
                  username: testUsername,
                  bio: testBio,
                ),
              ),
            ),
          ),
        ),
      );

      final profileScreen = tester.widget<ProfileScreen>(
        find.byType(ProfileScreen),
      );
      expect(profileScreen.uid, testUid);
      expect(profileScreen.username, testUsername);
      expect(profileScreen.bio, testBio);
    });

    testWidgets('should handle empty bio', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
          child: ScreenUtilInit(
            designSize: const Size(360, 690),
            builder: (context, _) => MaterialApp(
              home: TestSetup.createTestApp(
                includeUserProvider: true,
                child: const ProfileScreen(
                  uid: testUid,
                  username: testUsername,
                  bio: '',
                ),
              ),
            ),
          ),
        ),
      );

      final profileScreen = tester.widget<ProfileScreen>(
        find.byType(ProfileScreen),
      );
      expect(profileScreen.bio, '');
    });

    testWidgets('should handle long bio', (WidgetTester tester) async {
      final longBio = 'a' * 500;

      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
          child: ScreenUtilInit(
            designSize: const Size(360, 690),
            builder: (context, _) => MaterialApp(
              home: TestSetup.createTestApp(
                includeUserProvider: true,
                child: ProfileScreen(
                  uid: testUid,
                  username: testUsername,
                  bio: longBio,
                ),
              ),
            ),
          ),
        ),
      );

      final profileScreen = tester.widget<ProfileScreen>(
        find.byType(ProfileScreen),
      );
      expect(profileScreen.bio, longBio);
    });

    testWidgets('should handle special characters in username', (
      WidgetTester tester,
    ) async {
      const specialUsername = 'user@123!';

      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
          child: ScreenUtilInit(
            designSize: const Size(360, 690),
            builder: (context, _) => MaterialApp(
              home: TestSetup.createTestApp(
                includeUserProvider: true,
                child: const ProfileScreen(
                  uid: testUid,
                  username: specialUsername,
                  bio: testBio,
                ),
              ),
            ),
          ),
        ),
      );

      final profileScreen = tester.widget<ProfileScreen>(
        find.byType(ProfileScreen),
      );
      expect(profileScreen.username, specialUsername);
    });

    testWidgets('should handle special characters in bio', (
      WidgetTester tester,
    ) async {
      const specialBio = 'Bio with special chars: !@#\$%^&*()';

      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
          child: ScreenUtilInit(
            designSize: const Size(360, 690),
            builder: (context, _) => MaterialApp(
              home: TestSetup.createTestApp(
                includeUserProvider: true,
                child: const ProfileScreen(
                  uid: testUid,
                  username: testUsername,
                  bio: specialBio,
                ),
              ),
            ),
          ),
        ),
      );

      final profileScreen = tester.widget<ProfileScreen>(
        find.byType(ProfileScreen),
      );
      expect(profileScreen.bio, specialBio);
    });

    testWidgets('should maintain widget hierarchy', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
          child: ScreenUtilInit(
            designSize: const Size(360, 690),
            builder: (context, _) => MaterialApp(
              home: TestSetup.createTestApp(
                includeUserProvider: true,
                child: const ProfileScreen(
                  uid: testUid,
                  username: testUsername,
                  bio: testBio,
                ),
              ),
            ),
          ),
        ),
      );

      final profileScreen = tester.widget<ProfileScreen>(
        find.byType(ProfileScreen),
      );
      expect(profileScreen, isNotNull);
    });

    testWidgets('should handle different screen sizes', (
      WidgetTester tester,
    ) async {
      await tester.binding.setSurfaceSize(const Size(400, 800));

      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
          child: ScreenUtilInit(
            designSize: const Size(360, 690),
            builder: (context, _) => MaterialApp(
              home: TestSetup.createTestApp(
                includeUserProvider: true,
                child: const ProfileScreen(
                  uid: testUid,
                  username: testUsername,
                  bio: testBio,
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(ProfileScreen), findsOneWidget);
    });

    testWidgets('should have correct route name', (WidgetTester tester) async {
      expect(ProfileScreen.routeName, './profile_screen');
    });

    testWidgets('should handle different UID formats', (
      WidgetTester tester,
    ) async {
      const numericUid = '12345';

      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
          child: ScreenUtilInit(
            designSize: const Size(360, 690),
            builder: (context, _) => MaterialApp(
              home: TestSetup.createTestApp(
                includeUserProvider: true,
                child: const ProfileScreen(
                  uid: numericUid,
                  username: testUsername,
                  bio: testBio,
                ),
              ),
            ),
          ),
        ),
      );

      final profileScreen = tester.widget<ProfileScreen>(
        find.byType(ProfileScreen),
      );
      expect(profileScreen.uid, numericUid);
    });

    testWidgets('should handle username with spaces', (
      WidgetTester tester,
    ) async {
      const usernameWithSpaces = 'Test User Name';

      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
          child: ScreenUtilInit(
            designSize: const Size(360, 690),
            builder: (context, _) => MaterialApp(
              home: TestSetup.createTestApp(
                includeUserProvider: true,
                child: const ProfileScreen(
                  uid: testUid,
                  username: usernameWithSpaces,
                  bio: testBio,
                ),
              ),
            ),
          ),
        ),
      );

      final profileScreen = tester.widget<ProfileScreen>(
        find.byType(ProfileScreen),
      );
      expect(profileScreen.username, usernameWithSpaces);
    });

    testWidgets('should handle bio with newlines', (WidgetTester tester) async {
      const bioWithNewlines = 'Line 1\nLine 2\nLine 3';

      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
          child: ScreenUtilInit(
            designSize: const Size(360, 690),
            builder: (context, _) => MaterialApp(
              home: TestSetup.createTestApp(
                includeUserProvider: true,
                child: const ProfileScreen(
                  uid: testUid,
                  username: testUsername,
                  bio: bioWithNewlines,
                ),
              ),
            ),
          ),
        ),
      );

      final profileScreen = tester.widget<ProfileScreen>(
        find.byType(ProfileScreen),
      );
      expect(profileScreen.bio, bioWithNewlines);
    });

    testWidgets('should handle very long username', (
      WidgetTester tester,
    ) async {
      final longUsername = 'a' * 100;

      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
          child: ScreenUtilInit(
            designSize: const Size(360, 690),
            builder: (context, _) => MaterialApp(
              home: TestSetup.createTestApp(
                includeUserProvider: true,
                child: ProfileScreen(
                  uid: testUid,
                  username: longUsername,
                  bio: testBio,
                ),
              ),
            ),
          ),
        ),
      );

      final profileScreen = tester.widget<ProfileScreen>(
        find.byType(ProfileScreen),
      );
      expect(profileScreen.username, longUsername);
    });

    testWidgets('should handle empty username', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
          child: ScreenUtilInit(
            designSize: const Size(360, 690),
            builder: (context, _) => MaterialApp(
              home: TestSetup.createTestApp(
                includeUserProvider: true,
                child: const ProfileScreen(
                  uid: testUid,
                  username: '',
                  bio: testBio,
                ),
              ),
            ),
          ),
        ),
      );

      final profileScreen = tester.widget<ProfileScreen>(
        find.byType(ProfileScreen),
      );
      expect(profileScreen.username, '');
    });

    testWidgets('should handle empty UID', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
          child: ScreenUtilInit(
            designSize: const Size(360, 690),
            builder: (context, _) => MaterialApp(
              home: TestSetup.createTestApp(
                includeUserProvider: true,
                child: const ProfileScreen(
                  uid: '',
                  username: testUsername,
                  bio: testBio,
                ),
              ),
            ),
          ),
        ),
      );

      final profileScreen = tester.widget<ProfileScreen>(
        find.byType(ProfileScreen),
      );
      expect(profileScreen.uid, '');
    });

    testWidgets('should handle all empty props', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
          child: ScreenUtilInit(
            designSize: const Size(360, 690),
            builder: (context, _) => MaterialApp(
              home: TestSetup.createTestApp(
                includeUserProvider: true,
                child: const ProfileScreen(uid: '', username: '', bio: ''),
              ),
            ),
          ),
        ),
      );

      final profileScreen = tester.widget<ProfileScreen>(
        find.byType(ProfileScreen),
      );
      expect(profileScreen.uid, '');
      expect(profileScreen.username, '');
      expect(profileScreen.bio, '');
    });

    testWidgets('should handle unicode characters in username', (
      WidgetTester tester,
    ) async {
      const unicodeUsername = '用户123';

      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
          child: ScreenUtilInit(
            designSize: const Size(360, 690),
            builder: (context, _) => MaterialApp(
              home: TestSetup.createTestApp(
                includeUserProvider: true,
                child: const ProfileScreen(
                  uid: testUid,
                  username: unicodeUsername,
                  bio: testBio,
                ),
              ),
            ),
          ),
        ),
      );

      final profileScreen = tester.widget<ProfileScreen>(
        find.byType(ProfileScreen),
      );
      expect(profileScreen.username, unicodeUsername);
    });

    testWidgets('should handle unicode characters in bio', (
      WidgetTester tester,
    ) async {
      const unicodeBio = '这是一个测试简介';

      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
          child: ScreenUtilInit(
            designSize: const Size(360, 690),
            builder: (context, _) => MaterialApp(
              home: TestSetup.createTestApp(
                includeUserProvider: true,
                child: const ProfileScreen(
                  uid: testUid,
                  username: testUsername,
                  bio: unicodeBio,
                ),
              ),
            ),
          ),
        ),
      );

      final profileScreen = tester.widget<ProfileScreen>(
        find.byType(ProfileScreen),
      );
      expect(profileScreen.bio, unicodeBio);
    });

    testWidgets('should handle emoji in username', (WidgetTester tester) async {
      const emojiUsername = 'user😀123';

      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
          child: ScreenUtilInit(
            designSize: const Size(360, 690),
            builder: (context, _) => MaterialApp(
              home: TestSetup.createTestApp(
                includeUserProvider: true,
                child: const ProfileScreen(
                  uid: testUid,
                  username: emojiUsername,
                  bio: testBio,
                ),
              ),
            ),
          ),
        ),
      );

      final profileScreen = tester.widget<ProfileScreen>(
        find.byType(ProfileScreen),
      );
      expect(profileScreen.username, emojiUsername);
    });

    testWidgets('should handle emoji in bio', (WidgetTester tester) async {
      const emojiBio = 'This is a test bio with emojis 😀🎉🚀';

      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
          child: ScreenUtilInit(
            designSize: const Size(360, 690),
            builder: (context, _) => MaterialApp(
              home: TestSetup.createTestApp(
                includeUserProvider: true,
                child: const ProfileScreen(
                  uid: testUid,
                  username: testUsername,
                  bio: emojiBio,
                ),
              ),
            ),
          ),
        ),
      );

      final profileScreen = tester.widget<ProfileScreen>(
        find.byType(ProfileScreen),
      );
      expect(profileScreen.bio, emojiBio);
    });
  });

  group('ProfileScreenBody Widget Tests', () {
    const testUid = 'test-uid-123';
    const testUsername = 'testuser';
    const testBio = 'This is a test bio';

    testWidgets('should render ProfileScreenBody with correct structure', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
          child: ScreenUtilInit(
            designSize: const Size(360, 690),
            builder: (context, _) => MaterialApp(
              home: const ProfileScreenBody(
                uid: testUid,
                username: testUsername,
                bio: testBio,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(ProfileScreenBody), findsOneWidget);
    });

    testWidgets('should handle ProfileScreenBody with empty bio', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
          child: ScreenUtilInit(
            designSize: const Size(360, 690),
            builder: (context, _) => MaterialApp(
              home: const ProfileScreenBody(
                uid: testUid,
                username: testUsername,
                bio: '',
              ),
            ),
          ),
        ),
      );

      final profileBody = tester.widget<ProfileScreenBody>(
        find.byType(ProfileScreenBody),
      );
      expect(profileBody.bio, '');
    });

    testWidgets('should handle ProfileScreenBody with long bio', (
      WidgetTester tester,
    ) async {
      final longBio = 'a' * 500;

      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
          child: ScreenUtilInit(
            designSize: const Size(360, 690),
            builder: (context, _) => MaterialApp(
              home: ProfileScreenBody(
                uid: testUid,
                username: testUsername,
                bio: longBio,
              ),
            ),
          ),
        ),
      );

      final profileBody = tester.widget<ProfileScreenBody>(
        find.byType(ProfileScreenBody),
      );
      expect(profileBody.bio, longBio);
    });

    testWidgets('should maintain ProfileScreenBody widget hierarchy', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
          child: ScreenUtilInit(
            designSize: const Size(360, 690),
            builder: (context, _) => MaterialApp(
              home: const ProfileScreenBody(
                uid: testUid,
                username: testUsername,
                bio: testBio,
              ),
            ),
          ),
        ),
      );

      final profileBody = tester.widget<ProfileScreenBody>(
        find.byType(ProfileScreenBody),
      );
      expect(profileBody, isNotNull);
    });

    testWidgets('should handle ProfileScreenBody with special characters', (
      WidgetTester tester,
    ) async {
      const specialUsername = 'user@123!';
      const specialBio = 'Bio with special chars: !@#\$%^&*()';

      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
          child: ScreenUtilInit(
            designSize: const Size(360, 690),
            builder: (context, _) => MaterialApp(
              home: const ProfileScreenBody(
                uid: testUid,
                username: specialUsername,
                bio: specialBio,
              ),
            ),
          ),
        ),
      );

      final profileBody = tester.widget<ProfileScreenBody>(
        find.byType(ProfileScreenBody),
      );
      expect(profileBody.username, specialUsername);
      expect(profileBody.bio, specialBio);
    });

    testWidgets('should handle ProfileScreenBody with different screen sizes', (
      WidgetTester tester,
    ) async {
      await tester.binding.setSurfaceSize(const Size(400, 800));

      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
          child: ScreenUtilInit(
            designSize: const Size(360, 690),
            builder: (context, _) => MaterialApp(
              home: const ProfileScreenBody(
                uid: testUid,
                username: testUsername,
                bio: testBio,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(ProfileScreenBody), findsOneWidget);
    });
  });
}
