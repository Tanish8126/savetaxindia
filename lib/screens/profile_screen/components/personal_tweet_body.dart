import 'package:flutter/material.dart';

import '../../../utils/constants/constants.dart';
import 'personal_tweet.dart';

class PersonalTweetBody extends StatelessWidget {
  const PersonalTweetBody({super.key, required this.tweet});
  final String tweet;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pda(0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //==========Tweet Body===========
          PersonalTweet(tweet: tweet),

          //==========Space===========

          //==========Like + Comment + Share + Bookmark===========
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     LikeTweet(tweet: tweet, userId: userId),
          //     TweetComment(tweet: tweet, userId: userId),
          //     ShareTweet(tweet: tweet, userId: userId),
          //     BookmarkTweet(tweet: tweet, userId: userId),
          //   ],
          // ),
          Divider(
            color: const Color.fromARGB(255, 0, 0, 0).withValues(alpha: 0.4),
            endIndent: 20,
          ),
        ],
      ),
    );
  }
}
