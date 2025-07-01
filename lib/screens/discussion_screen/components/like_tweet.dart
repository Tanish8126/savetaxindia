import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../resources/post_data_methods.dart';
import '../../../utils/constants/constants.dart';
import '../../../models/feed_model.dart';

class LikeTweet extends StatefulWidget {
  final FeedModel tweet;
  final String userId;
  const LikeTweet({super.key, required this.tweet, required this.userId});

  @override
  State<LikeTweet> createState() => _LikeTweetState();
}

class _LikeTweetState extends State<LikeTweet> {
  late int likeCount;
  late bool isLiked;

  @override
  void initState() {
    super.initState();
    likeCount = widget.tweet.likeCount ?? 0;
    isLiked = widget.tweet.likeList?.contains(widget.userId) ?? false;
  }

  Future<void> _toggleLike() async {
    await PostDataMethods().addLikeToTweet(widget.tweet, widget.userId);
    setState(() {
      if (isLiked) {
        likeCount--;
      } else {
        likeCount++;
      }
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: _toggleLike,
      icon: SvgPicture.asset(
        "assets/icons/flash.svg",
        colorFilter: isLiked
            ? ColorFilter.mode(Colors.orange, BlendMode.srcIn)
            : ColorFilter.mode(Colors.grey, BlendMode.srcIn),
      ),
      label: Text(likeCount.toString(), style: tsBW(12, FontWeight.bold)),
    );
  }
}
