import 'package:flutter/material.dart';

class DiscussionScreen extends StatefulWidget {
  static String routeName = '/discussion_screen';
  const DiscussionScreen({super.key});

  @override
  State<DiscussionScreen> createState() => _DiscussionScreenState();
}

class _DiscussionScreenState extends State<DiscussionScreen> {
  final List<_DiscussionPost> _posts = [
    _DiscussionPost(
      user: 'Alice',
      message: 'What are the new tax rules for 2024?',
      time: DateTime.now().subtract(const Duration(minutes: 10)),
    ),
    _DiscussionPost(
      user: 'Bob',
      message: 'I am facing issues with HRA exemption. Any advice?',
      time: DateTime.now().subtract(const Duration(hours: 1)),
    ),
    _DiscussionPost(
      user: 'Priya',
      message: 'How to claim deductions for home loan interest?',
      time: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];
  final TextEditingController _controller = TextEditingController();

  void _addPost(String message) {
    if (message.trim().isEmpty) return;
    setState(() {
      _posts.insert(
        0,
        _DiscussionPost(
          user: 'You',
          message: message.trim(),
          time: DateTime.now(),
        ),
      );
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tax Discussion'),
        centerTitle: true,
        backgroundColor: Colors.green.shade700,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              reverse: false,
              padding: const EdgeInsets.all(12),
              itemCount: _posts.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final post = _posts[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                  child: ListTile(
                    leading: CircleAvatar(child: Text(post.user[0])),
                    title: Text(
                      post.user,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(post.message),
                    trailing: Text(
                      _formatTime(post.time),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Share your tax question or experience...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                    onSubmitted: _addPost,
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => _addPost(_controller.text),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final diff = now.difference(time);
    if (diff.inMinutes < 60) {
      return '${diff.inMinutes}m ago';
    } else if (diff.inHours < 24) {
      return '${diff.inHours}h ago';
    } else {
      return '${diff.inDays}d ago';
    }
  }
}

class _DiscussionPost {
  final String user;
  final String message;
  final DateTime time;
  _DiscussionPost({
    required this.user,
    required this.message,
    required this.time,
  });
}
