import 'package:flutter/material.dart';

import 'components/edit_profike_body.dart';

class EditProfileScreen extends StatelessWidget {
  static String routeName = './editprofile_screen';
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Edit Profile"),
      ),
      body: EditProfileScreenBody(),
    );
  }
}
