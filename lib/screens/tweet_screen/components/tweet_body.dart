import 'package:flutter/material.dart';

import '../../../utils/constants/constants.dart';
import 'tweet_exports.dart';

class TweetBody extends StatelessWidget {
  const TweetBody({
    super.key,
    required this.tweet,
    required this.userName,
    required this.place,
  });
  final String tweet, userName, place;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pda(0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //==========User Profile Pic + User Name + Place===========
          const UserProfilePic(),
          UserNamePlace(userName: userName, place: place),

          //==========Tweet Body===========
          Tweet(tweet: tweet),

          //==========Space===========
          sh04,

          //==========Like + Comment + Share + Bookmark===========
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const LikeTweet(),
              const TweetComment(),
              ShareTweet(tweet: tweet),
              const BookmarkTweet(),
            ],
          ),
        ],
      ),
    );
  }
}
