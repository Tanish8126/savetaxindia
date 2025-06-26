import 'package:flutter/material.dart';

import '../../../utils/constants/constants.dart';

class BottomLine extends StatelessWidget {
  const BottomLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pds(0.02, 0),
      child: Text(
        "If you have no other income or deductions to add, answer a few more questions and you'll be all set!",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
      ),
    );
  }
}
