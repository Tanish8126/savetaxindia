import 'package:flutter/material.dart';

import 'components/fetching_email_body.dart';

class FetchingEmail extends StatelessWidget {
  static String routeName = './fetching_email';
  const FetchingEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: FetchingEmailBody());
  }
}
