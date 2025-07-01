import 'package:flutter/material.dart';

import '../../../utils/constants/constants.dart';
import 'tweet_exports.dart';
import '../../../models/feed_model.dart';

class TweetBody extends StatelessWidget {
  const TweetBody({super.key, required this.tweetModel, required this.userId});
  final FeedModel tweetModel;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pda(0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //==========User Profile Pic + User Name + Place===========
          const UserProfilePic(),
          UserNamePlace(userName: tweetModel.userId, place: "Nims"),

          //==========Tweet Body===========
          Tweet(tweet: tweetModel.description),

          //==========Like + Comment + Share + Bookmark===========
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LikeTweet(tweet: tweetModel, userId: userId),
              const TweetComment(),
              ShareTweet(tweet: tweetModel.description),
              const BookmarkTweet(),
            ],
          ),
        ],
      ),
    );
  }
}
