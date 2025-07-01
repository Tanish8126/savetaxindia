import 'package:flutter/material.dart';

import '../../../utils/constants/constants.dart';

// PersonalTweet displays the text of a tweet in a styled format.
class PersonalTweet extends StatelessWidget {
  const PersonalTweet({super.key, required this.tweet});

  // The tweet text to display
  final String tweet;

  @override
  Widget build(BuildContext context) {
    return Text(
      tweet, // The tweet content
      style: tsCommonW(
        15,
        FontWeight.w500,
        const Color(0xFF949494),
      ), // Style for tweet text
      textAlign: TextAlign.left, // Align text to the left
    );
  }
}
