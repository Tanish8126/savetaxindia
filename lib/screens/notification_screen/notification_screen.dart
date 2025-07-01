import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/notification_model.dart';
import '../../resources/messaging_service.dart';
import '../../utils/constants/constants.dart';

class NotificationScreen extends StatefulWidget {
  static String routeName = "/notification_screen";
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final messagingService = MessagingService();

  @override
  void initState() {
    super.initState();
    messagingService.init();
  }

  @override
  Widget build(BuildContext context) {
    // Listen to notifications collection in Firestore
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications'), centerTitle: true),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('notifications')
            .orderBy('createdAt', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: \\${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('No notifications found.', style: tsB(18)),
            );
          }

          // Map Firestore documents to NotificationModel
          final notifications = snapshot.data!.docs.map((doc) {
            return NotificationModel.fromJson(
              doc.id,
              doc.data() as Map<String, dynamic>,
            );
          }).toList();

          return ListView.separated(
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
                  onTap: () {},
                ),
              );
            },
          );
        },
      ),
    );
  }

  // Returns an icon based on notification type
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

  // Formats the notification time for display
  String _formatTime(String? isoString) {
    if (isoString == null) return '';
    final date = DateTime.tryParse(isoString);
    if (date == null) return '';
    final now = DateTime.now();
    final diff = now.difference(date);
    if (diff.inMinutes < 60) {
      return '\\${diff.inMinutes}m ago';
    } else if (diff.inHours < 24) {
      return '\\${diff.inHours}h ago';
    } else {
      return '\\${diff.inDays}d ago';
    }
  }
}
