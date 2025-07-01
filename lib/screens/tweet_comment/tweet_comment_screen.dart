import 'package:flutter/material.dart';
import 'package:savetaxindia/utils/constants/colors.dart';

class TweetCommentScreen extends StatelessWidget {
  static const String routeName = '/tweet_comment_screen';
  const TweetCommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhite,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text('Comment')),
          body: Column(
            children: [
              TextField(decoration: InputDecoration(hintText: 'Comment')),
            ],
          ),
        ),
      ),
    );
  }
}
