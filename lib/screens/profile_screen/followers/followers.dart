import 'package:flutter/material.dart';

import '../../../utils/constants/constants.dart';
import '../following/components/following_data.dart';

// Followers widget displays a list of followers with a search field.
class Followers extends StatelessWidget {
  static String roteName = './followers';
  const Followers({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Search field for filtering followers
            TextFormField(
              decoration: InputDecoration(
                contentPadding: pda(0.02),
                counterStyle: tsB(12),
                hintText: "Search Follower",
                //   suffixIcon: Icon(Icons.search),
                errorStyle: tsB(12),
                prefixStyle: tsB(16),
                filled: true,
                fillColor: kWhite.withValues(alpha: 0.1),
                //  labelText: labeltext,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                // labelStyle: const TextStyle(color: kBlack),
                hintStyle: tsW(16),
                prefixIcon: const Icon(Icons.search),
                // prefix: prefixtext,
                errorMaxLines: 2,
                focusedBorder: oi15(kBlack.withValues(alpha: 0.2)),
                enabledBorder: oi15(kBlack.withValues(alpha: 0.2)),
                errorBorder: oi15(kRed),
                focusedErrorBorder: oi15(kBlack),
              ),
            ),
            sh03,
            // List of followers (currently hardcoded with FollowingData widgets)
            const FollowingData(),
            sh02,
            const FollowingData(),
            sh02,
            const FollowingData(),
            sh02,
            const FollowingData(),
            sh02,
            const FollowingData(),
            sh02,
            const FollowingData(),
          ],
        ),
      ),
    );
  }
}
