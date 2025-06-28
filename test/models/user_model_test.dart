import 'package:flutter_test/flutter_test.dart';
import 'package:savetaxindia/models/user_model.dart';

void main() {
  group('UserModel Tests', () {
    test('should create UserModel with all properties', () {
      final user = UserModel(
        userId: 'test_user_id',
        displayName: 'Test User',
        userName: 'testuser',
        profilePic: 'https://example.com/profile.jpg',
        bannerImage: 'https://example.com/banner.jpg',
        location: 'Test City',
        createdAt: '2023-01-01',
        followers: 100,
        following: 50,
        fcmToken: 'test_fcm_token',
        followersList: ['follower1', 'follower2'],
        followingList: ['following1', 'following2'],
      );

      expect(user.userId, 'test_user_id');
      expect(user.displayName, 'Test User');
      expect(user.userName, 'testuser');
      expect(user.profilePic, 'https://example.com/profile.jpg');
      expect(user.bannerImage, 'https://example.com/banner.jpg');
      expect(user.location, 'Test City');
      expect(user.createdAt, '2023-01-01');
      expect(user.followers, 100);
      expect(user.following, 50);
      expect(user.fcmToken, 'test_fcm_token');
      expect(user.followersList, ['follower1', 'follower2']);
      expect(user.followingList, ['following1', 'following2']);
    });

    test('should create UserModel from JSON', () {
      final json = {
        'userId': 'test_user_id',
        'displayName': 'Test User',
        'userName': 'testuser',
        'profilePic': 'https://example.com/profile.jpg',
        'bannerImage': 'https://example.com/banner.jpg',
        'location': 'Test City',
        'createdAt': '2023-01-01',
        'followers': 100,
        'following': 50,
        'fcmToken': 'test_fcm_token',
        'followerList': ['follower1', 'follower2'],
        'followingList': ['following1', 'following2'],
      };

      final user = UserModel.fromJson(json);

      expect(user.userId, 'test_user_id');
      expect(user.displayName, 'Test User');
      expect(user.userName, 'testuser');
      expect(user.profilePic, 'https://example.com/profile.jpg');
      expect(user.bannerImage, 'https://example.com/banner.jpg');
      expect(user.location, 'Test City');
      expect(user.createdAt, '2023-01-01');
      expect(user.followers, 2); // Length of followersList
      expect(user.following, 2); // Length of followingList
      expect(user.fcmToken, 'test_fcm_token');
      expect(user.followersList, ['follower1', 'follower2']);
      expect(user.followingList, ['following1', 'following2']);
    });

    test('should handle null JSON gracefully', () {
      final user = UserModel.fromJson(null);
      expect(user.userId, isNull);
      expect(user.displayName, isNull);
      expect(user.followersList, isEmpty);
    });

    test('should convert to JSON correctly', () {
      final user = UserModel(
        userId: 'test_user_id',
        displayName: 'Test User',
        userName: 'testuser',
        profilePic: 'https://example.com/profile.jpg',
        bannerImage: 'https://example.com/banner.jpg',
        location: 'Test City',
        createdAt: '2023-01-01',
        followers: 100,
        following: 50,
        fcmToken: 'test_fcm_token',
        followersList: ['follower1', 'follower2'],
        followingList: ['following1', 'following2'],
      );

      final json = user.toJson();

      expect(json['userId'], 'test_user_id');
      expect(json['displayName'], 'Test User');
      expect(json['userName'], 'testuser');
      expect(json['profilePic'], 'https://example.com/profile.jpg');
      expect(json['bannerImage'], 'https://example.com/banner.jpg');
      expect(json['location'], 'Test City');
      expect(json['createdAt'], '2023-01-01');
      expect(json['followers'], 2);
      expect(json['following'], 2);
      expect(json['fcmToken'], 'test_fcm_token');
      expect(json['followerList'], ['follower1', 'follower2']);
      expect(json['followingList'], ['following1', 'following2']);
    });

    test('should copy with new values', () {
      final originalUser = UserModel(
        userId: 'test_user_id',
        displayName: 'Test User',
        userName: 'testuser',
        profilePic: 'https://example.com/profile.jpg',
        bannerImage: 'https://example.com/banner.jpg',
        location: 'Test City',
        createdAt: '2023-01-01',
        followers: 100,
        following: 50,
        fcmToken: 'test_fcm_token',
        followersList: ['follower1', 'follower2'],
        followingList: ['following1', 'following2'],
      );

      final copiedUser = originalUser.copyWith(
        displayName: 'Updated User',
        location: 'Updated City',
        followers: 150,
      );

      expect(copiedUser.userId, 'test_user_id'); // Unchanged
      expect(copiedUser.displayName, 'Updated User'); // Changed
      expect(copiedUser.location, 'Updated City'); // Changed
      expect(copiedUser.followers, 150); // Changed
      expect(copiedUser.following, 50); // Unchanged
    });

    test('should return correct follower count string', () {
      final user = UserModel(followers: 100);
      expect(user.getFollower, '100');
    });

    test('should return correct following count string', () {
      final user = UserModel(following: 50);
      expect(user.getFollowing, '50');
    });

    test('should return zero for null follower count', () {
      final user = UserModel();
      expect(user.getFollower, '0');
    });

    test('should return zero for null following count', () {
      final user = UserModel();
      expect(user.getFollowing, '0');
    });

    test('should be equal when all properties are same', () {
      final user1 = UserModel(
        userId: 'test_user_id',
        displayName: 'Test User',
        userName: 'testuser',
      );

      final user2 = UserModel(
        userId: 'test_user_id',
        displayName: 'Test User',
        userName: 'testuser',
      );

      expect(user1, equals(user2));
    });

    test('should not be equal when properties are different', () {
      final user1 = UserModel(
        userId: 'test_user_id',
        displayName: 'Test User',
        userName: 'testuser',
      );

      final user2 = UserModel(
        userId: 'test_user_id',
        displayName: 'Different User',
        userName: 'testuser',
      );

      expect(user1, isNot(equals(user2)));
    });
  });
}
