import 'package:flutter/material.dart';

import 'components/body.dart';

class TaxInputScreen extends StatelessWidget {
  static String routeName = './tax_input.dart';
  const TaxInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Colors
    const Color lightGreen = Color(0xFFEAF7F0);

    return Scaffold(backgroundColor: lightGreen, body: Body());
  }
}
