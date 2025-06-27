import 'package:flutter/material.dart';

import 'components/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = './profile_screen';
  const ProfileScreen({
    super.key,
    required this.uid,
    required this.username,
    required this.bio,
  });

  final String uid;
  final String username;
  final String bio;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileScreenBody(uid: uid, username: username, bio: bio),
    );
  }
}
