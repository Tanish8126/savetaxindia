import 'package:flutter_test/flutter_test.dart';
import 'package:savetaxindia/models/feed_model.dart';
import 'package:savetaxindia/models/user_model.dart';

void main() {
  group('FeedModel Tests', () {
    late UserModel testUser;

    setUp(() {
      testUser = UserModel(
        userId: 'test_user_id',
        displayName: 'Test User',
        userName: 'testuser',
      );
    });

    test('should create FeedModel with all properties', () {
      final feed = FeedModel(
        key: 'test_key',
        parentkey: 'parent_key',
        description: 'Test description',
        userId: 'test_user_id',
        likeCount: 10,
        commentCount: 5,
        createdAt: '2023-01-01',
        imagePath: 'https://example.com/image.jpg',
        likeList: ['user1', 'user2'],
        user: testUser,
      );

      expect(feed.key, 'test_key');
      expect(feed.parentkey, 'parent_key');
      expect(feed.description, 'Test description');
      expect(feed.userId, 'test_user_id');
      expect(feed.likeCount, 10);
      expect(feed.commentCount, 5);
      expect(feed.createdAt, '2023-01-01');
      expect(feed.imagePath, 'https://example.com/image.jpg');
      expect(feed.likeList, ['user1', 'user2']);
      expect(feed.user, testUser);
    });

    test('should convert to JSON correctly', () {
      final feed = FeedModel(
        key: 'test_key',
        parentkey: 'parent_key',
        description: 'Test description',
        userId: 'test_user_id',
        likeCount: 10,
        commentCount: 5,
        createdAt: '2023-01-01',
        imagePath: 'https://example.com/image.jpg',
        likeList: ['user1', 'user2'],
        user: testUser,
      );

      final json = feed.toJson();

      expect(json['key'], isNull); // key is not included in toJson
      expect(json['parentkey'], 'parent_key');
      expect(json['userId'], 'test_user_id');
      expect(json['description'], 'Test description');
      expect(json['likeCount'], 10);
      expect(json['commentCount'], 5);
      expect(json['createdAt'], '2023-01-01');
      expect(json['imagePath'], 'https://example.com/image.jpg');
      expect(json['likeList'], ['user1', 'user2']);
      expect(json['user'], testUser.toJson());
    });

    test('should convert to Map correctly', () {
      final feed = FeedModel(
        key: 'test_key',
        parentkey: 'parent_key',
        description: 'Test description',
        userId: 'test_user_id',
        likeCount: 10,
        commentCount: 5,
        createdAt: '2023-01-01',
        imagePath: 'https://example.com/image.jpg',
        likeList: ['user1', 'user2'],
        user: testUser,
      );

      final map = feed.toMap();

      expect(map['key'], isNull); // key is not included in toMap
      expect(map['parentkey'], 'parent_key');
      expect(map['userId'], 'test_user_id');
      expect(map['description'], 'Test description');
      expect(map['likeCount'], 10);
      expect(map['commentCount'], 5);
      expect(map['createdAt'], '2023-01-01');
      expect(map['imagePath'], 'https://example.com/image.jpg');
      expect(map['likeList'], ['user1', 'user2']);
      expect(map['user'], testUser.toJson());
    });

    test('should create from Map with new schema (List<String>)', () {
      final map = {
        'key': 'test_key',
        'parentkey': 'parent_key',
        'description': 'Test description',
        'userId': 'test_user_id',
        'likeCount': 10,
        'commentCount': 5,
        'createdAt': '2023-01-01',
        'imagePath': 'https://example.com/image.jpg',
        'likeList': ['user1', 'user2'],
        'user': testUser.toJson(),
      };

      final feed = FeedModel.fromMap(map);

      expect(feed.key, 'test_key');
      expect(feed.parentkey, 'parent_key');
      expect(feed.description, 'Test description');
      expect(feed.userId, 'test_user_id');
      expect(feed.likeCount, 2); // Length of likeList
      expect(feed.commentCount, 5);
      expect(feed.createdAt, '2023-01-01');
      expect(feed.imagePath, 'https://example.com/image.jpg');
      expect(feed.likeList, ['user1', 'user2']);
      expect(feed.user?.userId, 'test_user_id');
    });

    test('should create from Map with old schema (Map)', () {
      final map = {
        'key': 'test_key',
        'parentkey': 'parent_key',
        'description': 'Test description',
        'userId': 'test_user_id',
        'likeCount': 10,
        'commentCount': 5,
        'createdAt': '2023-01-01',
        'imagePath': 'https://example.com/image.jpg',
        'likeList': {
          'key1': {'userId': 'user1'},
          'key2': {'userId': 'user2'},
        },
        'user': testUser.toJson(),
      };

      final feed = FeedModel.fromMap(map);

      expect(feed.key, 'test_key');
      expect(feed.parentkey, 'parent_key');
      expect(feed.description, 'Test description');
      expect(feed.userId, 'test_user_id');
      expect(feed.likeCount, 2); // Length of likeList map
      expect(feed.commentCount, 5);
      expect(feed.createdAt, '2023-01-01');
      expect(feed.imagePath, 'https://example.com/image.jpg');
      expect(feed.likeList, ['user1', 'user2']);
      expect(feed.user?.userId, 'test_user_id');
    });

    test('should handle null likeList', () {
      final map = {
        'key': 'test_key',
        'description': 'Test description',
        'userId': 'test_user_id',
        'likeCount': 10,
        'commentCount': 5,
        'createdAt': '2023-01-01',
        'imagePath': 'https://example.com/image.jpg',
        'likeList': null,
        'user': testUser.toJson(),
      };

      final feed = FeedModel.fromMap(map);

      expect(feed.likeList, isEmpty);
      expect(feed.likeCount, 0);
    });

    test('should handle null commentCount', () {
      final map = {
        'key': 'test_key',
        'description': 'Test description',
        'userId': 'test_user_id',
        'likeCount': 10,
        'commentCount': null,
        'createdAt': '2023-01-01',
        'imagePath': 'https://example.com/image.jpg',
        'likeList': [],
        'user': testUser.toJson(),
      };

      final feed = FeedModel.fromMap(map);

      expect(feed.commentCount, isNull);
    });

    test('should handle null user', () {
      final map = {
        'key': 'test_key',
        'description': 'Test description',
        'userId': 'test_user_id',
        'likeCount': 10,
        'commentCount': 5,
        'createdAt': '2023-01-01',
        'imagePath': 'https://example.com/image.jpg',
        'likeList': [],
        'user': null,
      };

      final feed = FeedModel.fromMap(map);

      expect(feed.user, isNull);
    });

    test('should handle empty likeList', () {
      final map = {
        'key': 'test_key',
        'description': 'Test description',
        'userId': 'test_user_id',
        'likeCount': 10,
        'commentCount': 5,
        'createdAt': '2023-01-01',
        'imagePath': 'https://example.com/image.jpg',
        'likeList': [],
        'user': testUser.toJson(),
      };

      final feed = FeedModel.fromMap(map);

      expect(feed.likeList, isEmpty);
      expect(feed.likeCount, 0);
    });

    test('should handle special characters in description', () {
      final feed = FeedModel(
        description: 'Test description with special chars: !@#\$%^&*()',
        userId: 'test_user_id',
        createdAt: '2023-01-01',
      );

      expect(
        feed.description,
        'Test description with special chars: !@#\$%^&*()',
      );
    });

    test('should handle long description', () {
      final longDescription = 'a' * 1000;
      final feed = FeedModel(
        description: longDescription,
        userId: 'test_user_id',
        createdAt: '2023-01-01',
      );

      expect(feed.description, longDescription);
    });
  });
}
