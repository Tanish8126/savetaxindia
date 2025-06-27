import 'package:flutter/material.dart';

import 'components/choose_tax_body.dart';

class ChooseTaxYearScreen extends StatelessWidget {
  static const String routeName = '/choose_tax_year';
  const ChooseTaxYearScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton(), elevation: 0),
      body: ChooseTaxScreenBody(),
    );
  }
}
