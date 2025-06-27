import 'package:flutter/material.dart';

import 'components/my_account_body.dart';

class MyAccountScreen extends StatelessWidget {
  static const routeName = '/my_account_screen';
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MyAccountScreenBody());
  }
}
