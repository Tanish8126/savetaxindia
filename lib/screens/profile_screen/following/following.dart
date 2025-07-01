import 'package:flutter/material.dart';

import '../../../utils/constants/constants.dart';
import 'components/following_data.dart';

// Following widget displays a list of users the current user is following, with a search field.
class Following extends StatelessWidget {
  static String roteName = './following';
  const Following({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Search field for filtering following users
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
            // List of following users (currently hardcoded with FollowingData widgets)
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
