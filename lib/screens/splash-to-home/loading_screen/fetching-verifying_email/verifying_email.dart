import 'package:flutter/material.dart';

import 'components/verifying_email_body.dart';

class VerifingEmail extends StatelessWidget {
  static String routeName = './verifyingemail';
  const VerifingEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: VerifyEmailBody());
  }
}
