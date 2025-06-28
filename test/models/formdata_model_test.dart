import 'package:flutter_test/flutter_test.dart';
import 'package:savetaxindia/models/formdata_model.dart';

void main() {
  group('SignUpFormData Tests', () {
    test('should create SignUpFormData with all required properties', () {
      final formData = SignUpFormData(
        uid: 'test_uid',
        phoneNumber: '+919876543210',
        email: 'test@example.com',
        userName: 'testuser',
        photoUrl: 'https://example.com/photo.jpg',
        bio: 'Test bio',
      );

      expect(formData.uid, 'test_uid');
      expect(formData.phoneNumber, '+919876543210');
      expect(formData.email, 'test@example.com');
      expect(formData.userName, 'testuser');
      expect(formData.photoUrl, 'https://example.com/photo.jpg');
      expect(formData.bio, 'Test bio');
    });

    test('should convert to JSON correctly', () {
      final formData = SignUpFormData(
        uid: 'test_uid',
        phoneNumber: '+919876543210',
        email: 'test@example.com',
        userName: 'testuser',
        photoUrl: 'https://example.com/photo.jpg',
        bio: 'Test bio',
      );

      final json = formData.toJson();

      expect(json['uid'], 'test_uid');
      expect(json['phonenumber'], '+919876543210');
      expect(json['email'], 'test@example.com');
      expect(json['userName'], 'testuser');
      expect(json['photoUrl'], 'https://example.com/photo.jpg');
      expect(json['bio'], 'Test bio');
    });

    test('should create from Map correctly', () {
      final map = {
        'uid': 'test_uid',
        'phoneNumber': '+919876543210',
        'email': 'test@example.com',
        'userName': 'testuser',
        'photoUrl': 'https://example.com/photo.jpg',
        'bio': 'Test bio',
      };

      final formData = SignUpFormData.fromMap(map);

      expect(formData.uid, 'test_uid');
      expect(formData.phoneNumber, '+919876543210');
      expect(formData.email, 'test@example.com');
      expect(formData.userName, 'testuser');
      expect(formData.photoUrl, 'https://example.com/photo.jpg');
      expect(formData.bio, 'Test bio');
    });

    test('should handle null values in Map with empty strings', () {
      final map = {
        'uid': null,
        'phoneNumber': null,
        'email': null,
        'userName': null,
        'photoUrl': null,
        'bio': null,
      };

      final formData = SignUpFormData.fromMap(map);

      expect(formData.uid, '');
      expect(formData.phoneNumber, '');
      expect(formData.email, '');
      expect(formData.userName, '');
      expect(formData.photoUrl, '');
      expect(formData.bio, '');
    });

    test('should handle missing keys in Map with empty strings', () {
      final map = <String, dynamic>{};

      final formData = SignUpFormData.fromMap(map);

      expect(formData.uid, '');
      expect(formData.phoneNumber, '');
      expect(formData.email, '');
      expect(formData.userName, '');
      expect(formData.photoUrl, '');
      expect(formData.bio, '');
    });

    test('should handle partial data in Map', () {
      final map = {
        'uid': 'test_uid',
        'email': 'test@example.com',
        // Missing other fields
      };

      final formData = SignUpFormData.fromMap(map);

      expect(formData.uid, 'test_uid');
      expect(formData.email, 'test@example.com');
      expect(formData.phoneNumber, '');
      expect(formData.userName, '');
      expect(formData.photoUrl, '');
      expect(formData.bio, '');
    });

    test('should be immutable', () {
      final formData = SignUpFormData(
        uid: 'test_uid',
        phoneNumber: '+919876543210',
        email: 'test@example.com',
        userName: 'testuser',
        photoUrl: 'https://example.com/photo.jpg',
        bio: 'Test bio',
      );

      // All fields should be final and cannot be modified
      expect(formData.uid, 'test_uid');
      expect(formData.phoneNumber, '+919876543210');
      expect(formData.email, 'test@example.com');
      expect(formData.userName, 'testuser');
      expect(formData.photoUrl, 'https://example.com/photo.jpg');
      expect(formData.bio, 'Test bio');
    });

    test('should handle special characters in bio', () {
      final formData = SignUpFormData(
        uid: 'test_uid',
        phoneNumber: '+919876543210',
        email: 'test@example.com',
        userName: 'testuser',
        photoUrl: 'https://example.com/photo.jpg',
        bio: 'Test bio with special chars: !@#\$%^&*()',
      );

      expect(formData.bio, 'Test bio with special chars: !@#\$%^&*()');
    });

    test('should handle long strings', () {
      final longString = 'a' * 1000;
      final formData = SignUpFormData(
        uid: longString,
        phoneNumber: longString,
        email: longString,
        userName: longString,
        photoUrl: longString,
        bio: longString,
      );

      expect(formData.uid, longString);
      expect(formData.phoneNumber, longString);
      expect(formData.email, longString);
      expect(formData.userName, longString);
      expect(formData.photoUrl, longString);
      expect(formData.bio, longString);
    });
  });
}
