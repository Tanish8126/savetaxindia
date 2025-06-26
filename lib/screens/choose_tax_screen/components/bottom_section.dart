import 'package:flutter/material.dart';

import '../../../utils/constants/constants.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.verified_user, color: kBlack, size: 20),
            sh01,
            Text(
              "Encrypted data transfer with",
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
            sh01,
            Text("ELSTER", style: tsBW(13, FontWeight.bold)),
          ],
        ),
        sh02,
        GestureDetector(
          onTap: () {},
          child: Text(
            "To learn more about how we use and protect your data, check our Privacy Policy.",
            style: TextStyle(
              fontSize: 13,
              color: Colors.green.shade700,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
