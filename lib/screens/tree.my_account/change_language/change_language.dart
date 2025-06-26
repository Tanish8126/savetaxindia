import 'package:flutter/material.dart';
import '../../../utils/constants/constants.dart';
import 'components/body.dart';

class ChangeLanguageScreen extends StatelessWidget {
  static const routeName = '/change_language';
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhite,
        title: Text('Change Language', style: tsBW(20, FontWeight.bold)),
        centerTitle: true,
      ),
      body: const Body(),
    );
  }
}
