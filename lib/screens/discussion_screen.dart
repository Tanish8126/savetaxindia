import 'package:flutter/material.dart';

import 'tweet_screen/components/tweet_exports.dart';

class DiscussionScreen extends StatefulWidget {
  static String routeName = '/discussion_screen';
  const DiscussionScreen({super.key});

  @override
  State<DiscussionScreen> createState() => _DiscussionScreenState();
}

class _DiscussionScreenState extends State<DiscussionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: const Color.fromARGB(255, 247, 255, 239),
      appBar: AppBar(title: const Text('Discussion'), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              reverse: false,
              padding: const EdgeInsets.all(12),
              itemCount: 3,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                //   final post = _posts[index];
                return TweetBody(
                  tweet:
                      "In the corridors of Ridgeview College, whispers spread like wildfire. From scandalous love affairs to clandestine alliances, the gossip mill churned ceaselessly. Friends turned foes, secrets unveiled, and reputations shattered. Amidst the chaos, the power of words held sway, forever altering the course of friendships and shaping the college's social landscape.",
                  userName: "FireFighter",
                  place: "Nims",
                );

                // );
              },
            ),
          ),
        ],
      ),
    );
  }
}
