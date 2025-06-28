import 'package:flutter_test/flutter_test.dart';
import 'package:savetaxindia/models/formdata_model.dart';
import 'package:savetaxindia/providers/user_provider.dart';

void main() {
  group('UserProvider Tests', () {
    late UserProvider userProvider;

    setUp(() {
      userProvider = UserProvider();
    });

    test('should initialize with default user data', () {
      expect(userProvider.user.uid, '');
      expect(userProvider.user.phoneNumber, '');
      expect(userProvider.user.email, '');
      expect(userProvider.user.userName, '');
      expect(userProvider.user.photoUrl, '');
      expect(userProvider.user.bio, '');
    });

    test('should set user data correctly', () {
      final newUser = SignUpFormData(
        uid: 'test_uid',
        phoneNumber: '+919876543210',
        email: 'test@example.com',
        userName: 'testuser',
        photoUrl: 'https://example.com/photo.jpg',
        bio: 'Test bio',
      );

      userProvider.setUser(newUser);

      expect(userProvider.user.uid, 'test_uid');
      expect(userProvider.user.phoneNumber, '+919876543210');
      expect(userProvider.user.email, 'test@example.com');
      expect(userProvider.user.userName, 'testuser');
      expect(userProvider.user.photoUrl, 'https://example.com/photo.jpg');
      expect(userProvider.user.bio, 'Test bio');
    });

    test('should update user data when setUser is called multiple times', () {
      final firstUser = SignUpFormData(
        uid: 'first_uid',
        phoneNumber: '+919876543210',
        email: 'first@example.com',
        userName: 'firstuser',
        photoUrl: 'https://example.com/first.jpg',
        bio: 'First bio',
      );

      final secondUser = SignUpFormData(
        uid: 'second_uid',
        phoneNumber: '+919876543211',
        email: 'second@example.com',
        userName: 'seconduser',
        photoUrl: 'https://example.com/second.jpg',
        bio: 'Second bio',
      );

      userProvider.setUser(firstUser);
      expect(userProvider.user.uid, 'first_uid');
      expect(userProvider.user.email, 'first@example.com');

      userProvider.setUser(secondUser);
      expect(userProvider.user.uid, 'second_uid');
      expect(userProvider.user.email, 'second@example.com');
      expect(userProvider.user.phoneNumber, '+919876543211');
      expect(userProvider.user.userName, 'seconduser');
      expect(userProvider.user.photoUrl, 'https://example.com/second.jpg');
      expect(userProvider.user.bio, 'Second bio');
    });

    test('should handle user with empty strings', () {
      final emptyUser = SignUpFormData(
        uid: '',
        phoneNumber: '',
        email: '',
        userName: '',
        photoUrl: '',
        bio: '',
      );

      userProvider.setUser(emptyUser);

      expect(userProvider.user.uid, '');
      expect(userProvider.user.phoneNumber, '');
      expect(userProvider.user.email, '');
      expect(userProvider.user.userName, '');
      expect(userProvider.user.photoUrl, '');
      expect(userProvider.user.bio, '');
    });

    test('should handle user with special characters', () {
      final specialUser = SignUpFormData(
        uid: 'test_uid',
        phoneNumber: '+91-987-654-3210',
        email: 'test+tag@example.com',
        userName: 'test_user_123',
        photoUrl: 'https://example.com/photo.jpg?size=large',
        bio: 'Bio with special chars: !@#\$%^&*()',
      );

      userProvider.setUser(specialUser);

      expect(userProvider.user.uid, 'test_uid');
      expect(userProvider.user.phoneNumber, '+91-987-654-3210');
      expect(userProvider.user.email, 'test+tag@example.com');
      expect(userProvider.user.userName, 'test_user_123');
      expect(
        userProvider.user.photoUrl,
        'https://example.com/photo.jpg?size=large',
      );
      expect(userProvider.user.bio, 'Bio with special chars: !@#\$%^&*()');
    });

    test('should handle user with long strings', () {
      final longString = 'a' * 1000;
      final longUser = SignUpFormData(
        uid: longString,
        phoneNumber: longString,
        email: longString,
        userName: longString,
        photoUrl: longString,
        bio: longString,
      );

      userProvider.setUser(longUser);

      expect(userProvider.user.uid, longString);
      expect(userProvider.user.phoneNumber, longString);
      expect(userProvider.user.email, longString);
      expect(userProvider.user.userName, longString);
      expect(userProvider.user.photoUrl, longString);
      expect(userProvider.user.bio, longString);
    });

    test(
      'should return the same user instance when getter is called multiple times',
      () {
        final testUser = SignUpFormData(
          uid: 'test_uid',
          phoneNumber: '+919876543210',
          email: 'test@example.com',
          userName: 'testuser',
          photoUrl: 'https://example.com/photo.jpg',
          bio: 'Test bio',
        );

        userProvider.setUser(testUser);

        final firstCall = userProvider.user;
        final secondCall = userProvider.user;

        expect(firstCall, same(secondCall));
      },
    );

    test('should handle partial user data updates', () {
      final initialUser = SignUpFormData(
        uid: 'initial_uid',
        phoneNumber: '+919876543210',
        email: 'initial@example.com',
        userName: 'initialuser',
        photoUrl: 'https://example.com/initial.jpg',
        bio: 'Initial bio',
      );

      userProvider.setUser(initialUser);

      final updatedUser = SignUpFormData(
        uid: 'updated_uid',
        phoneNumber: '+919876543211',
        email: 'updated@example.com',
        userName: 'updateduser',
        photoUrl: 'https://example.com/updated.jpg',
        bio: 'Updated bio',
      );

      userProvider.setUser(updatedUser);

      // Verify all fields are updated
      expect(userProvider.user.uid, 'updated_uid');
      expect(userProvider.user.phoneNumber, '+919876543211');
      expect(userProvider.user.email, 'updated@example.com');
      expect(userProvider.user.userName, 'updateduser');
      expect(userProvider.user.photoUrl, 'https://example.com/updated.jpg');
      expect(userProvider.user.bio, 'Updated bio');
    });
  });
}
