import 'package:flutter/material.dart';

import '../../utils/constants/constants.dart';
import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = './profile_screen';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: kPrimary, body: Body());
  }
}
