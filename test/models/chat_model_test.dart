import 'package:flutter_test/flutter_test.dart';
import 'package:savetaxindia/models/chat_model.dart';

void main() {
  group('ChatMessage Tests', () {
    test('should create ChatMessage with all properties', () {
      final chatMessage = ChatMessage(
        key: 'test_key',
        senderId: 'sender123',
        message: 'Hello, how are you?',
        seen: true,
        createdAt: '2023-01-01T10:00:00Z',
        timeStamp: '2023-01-01T10:00:00Z',
        senderName: 'John Doe',
        receiverId: 'receiver456',
      );

      expect(chatMessage.key, 'test_key');
      expect(chatMessage.senderId, 'sender123');
      expect(chatMessage.message, 'Hello, how are you?');
      expect(chatMessage.seen, true);
      expect(chatMessage.createdAt, '2023-01-01T10:00:00Z');
      expect(chatMessage.timeStamp, '2023-01-01T10:00:00Z');
      expect(chatMessage.senderName, 'John Doe');
      expect(chatMessage.receiverId, 'receiver456');
    });

    test('should create ChatMessage with minimal required properties', () {
      final chatMessage = ChatMessage(
        senderId: 'sender123',
        seen: false,
        receiverId: 'receiver456',
        senderName: 'John Doe',
        timeStamp: '2023-01-01T10:00:00Z',
      );

      expect(chatMessage.senderId, 'sender123');
      expect(chatMessage.seen, false);
      expect(chatMessage.receiverId, 'receiver456');
      expect(chatMessage.senderName, 'John Doe');
      expect(chatMessage.timeStamp, '2023-01-01T10:00:00Z');
      expect(chatMessage.key, isNull);
      expect(chatMessage.message, isNull);
      expect(chatMessage.createdAt, isNull);
    });

    test('should create from JSON correctly', () {
      final json = {
        'key': 'test_key',
        'sender_id': 'sender123',
        'message': 'Hello, how are you?',
        'seen': true,
        'created_at': '2023-01-01T10:00:00Z',
        'timeStamp': '2023-01-01T10:00:00Z',
        'senderName': 'John Doe',
        'receiverId': 'receiver456',
      };

      final chatMessage = ChatMessage.fromJson(json);

      expect(chatMessage.key, 'test_key');
      expect(chatMessage.senderId, 'sender123');
      expect(chatMessage.message, 'Hello, how are you?');
      expect(chatMessage.seen, true);
      expect(chatMessage.createdAt, '2023-01-01T10:00:00Z');
      expect(chatMessage.timeStamp, '2023-01-01T10:00:00Z');
      expect(chatMessage.senderName, 'John Doe');
      expect(chatMessage.receiverId, 'receiver456');
    });

    test('should convert to JSON correctly', () {
      final chatMessage = ChatMessage(
        key: 'test_key',
        senderId: 'sender123',
        message: 'Hello, how are you?',
        seen: true,
        createdAt: '2023-01-01T10:00:00Z',
        timeStamp: '2023-01-01T10:00:00Z',
        senderName: 'John Doe',
        receiverId: 'receiver456',
      );

      final json = chatMessage.toJson();

      expect(json['key'], 'test_key');
      expect(json['sender_id'], 'sender123');
      expect(json['message'], 'Hello, how are you?');
      expect(json['seen'], true);
      expect(json['created_at'], '2023-01-01T10:00:00Z');
      expect(json['timeStamp'], '2023-01-01T10:00:00Z');
      expect(json['senderName'], 'John Doe');
      expect(json['receiverId'], 'receiver456');
    });

    test('should handle null values in JSON', () {
      final json = {
        'key': null,
        'sender_id': 'sender123',
        'message': null,
        'seen': true,
        'created_at': null,
        'timeStamp': '2023-01-01T10:00:00Z',
        'senderName': 'John Doe',
        'receiverId': 'receiver456',
      };

      final chatMessage = ChatMessage.fromJson(json);

      expect(chatMessage.key, isNull);
      expect(chatMessage.senderId, 'sender123');
      expect(chatMessage.message, isNull);
      expect(chatMessage.seen, true);
      expect(chatMessage.createdAt, isNull);
      expect(chatMessage.timeStamp, '2023-01-01T10:00:00Z');
      expect(chatMessage.senderName, 'John Doe');
      expect(chatMessage.receiverId, 'receiver456');
    });

    test('should handle empty message', () {
      final chatMessage = ChatMessage(
        senderId: 'sender123',
        message: '',
        seen: false,
        receiverId: 'receiver456',
        senderName: 'John Doe',
        timeStamp: '2023-01-01T10:00:00Z',
      );

      expect(chatMessage.message, '');
    });

    test('should handle long message', () {
      final longMessage = 'a' * 1000;
      final chatMessage = ChatMessage(
        senderId: 'sender123',
        message: longMessage,
        seen: false,
        receiverId: 'receiver456',
        senderName: 'John Doe',
        timeStamp: '2023-01-01T10:00:00Z',
      );

      expect(chatMessage.message, longMessage);
    });

    test('should handle special characters in message', () {
      final specialMessage =
          'Message with special chars: !@#\$%^&*()_+-=[]{}|;:,.<>?';
      final chatMessage = ChatMessage(
        senderId: 'sender123',
        message: specialMessage,
        seen: false,
        receiverId: 'receiver456',
        senderName: 'John Doe',
        timeStamp: '2023-01-01T10:00:00Z',
      );

      expect(chatMessage.message, specialMessage);
    });

    test('should handle unread message', () {
      final chatMessage = ChatMessage(
        senderId: 'sender123',
        message: 'New message',
        seen: false,
        receiverId: 'receiver456',
        senderName: 'John Doe',
        timeStamp: '2023-01-01T10:00:00Z',
      );

      expect(chatMessage.seen, false);
    });

    test('should handle read message', () {
      final chatMessage = ChatMessage(
        senderId: 'sender123',
        message: 'Read message',
        seen: true,
        receiverId: 'receiver456',
        senderName: 'John Doe',
        timeStamp: '2023-01-01T10:00:00Z',
      );

      expect(chatMessage.seen, true);
    });

    test('should handle different timestamp formats', () {
      final chatMessage = ChatMessage(
        senderId: 'sender123',
        message: 'Test message',
        seen: false,
        receiverId: 'receiver456',
        senderName: 'John Doe',
        timeStamp: '1640995200000', // Unix timestamp
      );

      expect(chatMessage.timeStamp, '1640995200000');
    });

    test('should handle sender and receiver with same ID', () {
      final chatMessage = ChatMessage(
        senderId: 'user123',
        message: 'Self message',
        seen: true,
        receiverId: 'user123',
        senderName: 'John Doe',
        timeStamp: '2023-01-01T10:00:00Z',
      );

      expect(chatMessage.senderId, 'user123');
      expect(chatMessage.receiverId, 'user123');
    });
  });
}
