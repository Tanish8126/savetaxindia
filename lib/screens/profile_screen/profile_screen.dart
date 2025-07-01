import 'package:flutter/material.dart';

import 'components/profile_body.dart';

// ProfileScreen is the main screen for displaying a user's profile.
// It receives the user's uid, username, and bio as required parameters.
class ProfileScreen extends StatelessWidget {
  // Route name for navigation
  static String routeName = './profile_screen';
  const ProfileScreen({
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
    // The main body of the profile screen is handled by ProfileScreenBody
    // which takes the uid, username, and bio as input.
    return Scaffold(
      body: ProfileScreenBody(uid: uid, username: username, bio: bio),
    );
  }
}
