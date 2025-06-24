import 'package:flutter/material.dart';
import '../../models/notification_model.dart';

class NotificationScreen extends StatelessWidget {
  static String routeName = "/notification_screen";
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample notifications
    final List<NotificationModel> notifications = [
      NotificationModel(
        id: '1',
        tweetKey: 'tweet1',
        type: 'like',
        createdAt: DateTime.now()
            .subtract(Duration(minutes: 5))
            .toIso8601String(),
        updatedAt: null,
        data: {'title': 'New Like', 'body': 'Someone liked your post.'},
      ),
      NotificationModel(
        id: '2',
        tweetKey: 'tweet2',
        type: 'comment',
        createdAt: DateTime.now()
            .subtract(Duration(hours: 1))
            .toIso8601String(),
        updatedAt: null,
        data: {'title': 'New Comment', 'body': 'You have a new comment.'},
      ),
      NotificationModel(
        id: '3',
        tweetKey: 'tweet3',
        type: 'follow',
        createdAt: DateTime.now().subtract(Duration(days: 1)).toIso8601String(),
        updatedAt: null,
        data: {'title': 'New Follower', 'body': 'You have a new follower!'},
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Notifications'), centerTitle: true),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        itemCount: notifications.length,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: _iconForType(notification.type),
              title: Text(notification.data?["title"] ?? "Notification"),
              subtitle: Text(notification.data?["body"] ?? ""),
              trailing: Text(_formatTime(notification.createdAt)),
            ),
          );
        },
      ),
    );
  }

  Widget _iconForType(String? type) {
    switch (type) {
      case 'like':
        return Icon(Icons.favorite, color: Colors.red);
      case 'comment':
        return Icon(Icons.comment, color: Colors.blue);
      case 'follow':
        return Icon(Icons.person_add, color: Colors.green);
      default:
        return Icon(Icons.notifications, color: Colors.grey);
    }
  }

  String _formatTime(String? isoString) {
    if (isoString == null) return '';
    final date = DateTime.tryParse(isoString);
    if (date == null) return '';
    final now = DateTime.now();
    final diff = now.difference(date);
    if (diff.inMinutes < 60) {
      return '${diff.inMinutes}m ago';
    } else if (diff.inHours < 24) {
      return '${diff.inHours}h ago';
    } else {
      return '${diff.inDays}d ago';
    }
  }
}
