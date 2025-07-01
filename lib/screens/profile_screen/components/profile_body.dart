import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/constants.dart';
import 'info.dart';
import 'personal_tweet_body.dart';

// ProfileScreenBody builds the main content of the profile screen.
// It displays the background image, profile image, user info, and tweets.
class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({
    super.key,
    required this.uid,
    required this.username,
    required this.bio,
  });

  // User's unique id
  final String uid;
  // User's username
  final String username;
  // User's bio
  final String bio;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Stack for background and profile image
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              //==================Background Image==================
              Padding(
                padding: pdo(0, 0.035, 0, 0),
                child: AspectRatio(
                  aspectRatio: 3,
                  child: Image.asset("assets/images/bg_image.png"),
                ),
              ),

              //==========Profile Image + Edit Image Button===========
              Padding(
                padding: pdo(0, 0, 0.03, 0),
                child: GestureDetector(
                  onTap: () {
                    // Show dialog to edit profile image
                    _showSimpleDialog(context);
                  },
                  child: CircleAvatar(
                    backgroundImage: const AssetImage(
                      "assets/images/profile.png",
                    ),
                    backgroundColor: Colors.grey[800],
                    radius: 30.r,
                  ),
                ),
              ),
            ],
          ),

          //==================User Info==================
          // Displays username, bio, edit button, followers, etc.
          Info(username: username, bio: bio, uid: uid),
          Divider(
            color: const Color.fromARGB(255, 0, 0, 0).withValues(alpha: 0.4),
          ),

          //==================Tweet Body==================
          // List of user's tweets (currently hardcoded)
          const PersonalTweetBody(
            tweet:
                "In the corridors of Ridgeview College, whispers spread like wildfire. From scandalous love affairs to clandestine alliances, the gossip mill churned ceaselessly. Friends turned foes, secrets unveiled, and reputations shattered. Amidst the chaos, the power of words held sway, forever altering the course of friendships and shaping the college's social landscape.",
          ),
          const PersonalTweetBody(
            tweet:
                "In the corridors of Ridgeview College, whispers spread like wildfire. From scandalous love affairs to clandestine alliances, the gossip mill churned ceaselessly. Friends turned foes, secrets unveiled, and reputations shattered. Amidst the chaos, the power of words held sway, forever altering the course of friendships and shaping the college's social landscape.",
          ),
          const PersonalTweetBody(
            tweet:
                "In the corridors of Ridgeview College, whispers spread like wildfire. From scandalous love affairs to clandestine alliances, the gossip mill churned ceaselessly. Friends turned foes, secrets unveiled, and reputations shattered. Amidst the chaos, the power of words held sway, forever altering the course of friendships and shaping the college's social landscape.",
          ),
          const PersonalTweetBody(
            tweet:
                "In the corridors of Ridgeview College, whispers spread like wildfire. From scandalous love affairs to clandestine alliances, the gossip mill churned ceaselessly. Friends turned foes, secrets unveiled, and reputations shattered. Amidst the chaos, the power of words held sway, forever altering the course of friendships and shaping the college's social landscape.",
          ),
          const PersonalTweetBody(
            tweet:
                "In the corridors of Ridgeview College, whispers spread like wildfire. From scandalous love affairs to clandestine alliances, the gossip mill churned ceaselessly. Friends turned foes, secrets unveiled, and reputations shattered. Amidst the chaos, the power of words held sway, forever altering the course of friendships and shaping the college's social landscape.",
          ),
        ],
      ),
    );
  }

  //==================Edit Image Dialog==================
  // Shows a dialog for editing the profile image (currently only shows Cancel)
  Future<void> _showSimpleDialog(BuildContext context) async {
    await showDialog<void>(
      context: context,
      barrierColor: ktrans,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ktrans,
          insetPadding: pda(0.0),
          contentPadding: pda(0.0),
          content: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              CircleAvatar(
                backgroundImage: const AssetImage("assets/images/profile.png"),
                backgroundColor: Colors.grey[800],
                radius: 50.r,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  gradient: const LinearGradient(
                    colors: [Color(0x19ffffff), Color(0x19d9d9d9)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Text('Cancel', style: tsWW(12, FontWeight.w600)),
              ),
            ],
          ),
        );
      },
    );
  }
}
