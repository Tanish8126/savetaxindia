import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/constants/constants.dart';

class UrlLauncher extends StatelessWidget {
  const UrlLauncher({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        text: "By adding a document, you agree to our ",
        style: tsB(14),
        children: [
          TextSpan(
            text: "Terms of Service",
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 0, 32, 3),
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launchUrl(Uri.parse("https://www.google.com"));
              },
          ),
          TextSpan(text: " and accept our "),
          TextSpan(
            text: "Privacy Policy",
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 0, 32, 3),
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launchUrl(Uri.parse("https://www.google.com"));
              },
          ),
          TextSpan(text: "."),
        ],
      ),
    );
  }
}
