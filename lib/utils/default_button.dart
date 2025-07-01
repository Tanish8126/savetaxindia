// This file defines a reusable default button widget for the app.
import 'package:flutter/material.dart';

import 'constants/constants.dart';

// Stateless widget for a customizable button
class DefaultButton extends StatelessWidget {
  // Constructor requires button text, size, and a callback for press event
  const DefaultButton({
    super.key,
    required this.text,
    required this.size,
    required this.press,
  });
  final String text; // Text to display on the button
  final Function press; // Callback function when button is pressed
  final double size; // Font size for the button text

  @override
  Widget build(BuildContext context) {
    // SizedBox ensures the button takes full width and fixed height
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(65), // Responsive height
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ), // Rounded corners
          foregroundColor: kBlack, // Text color
          backgroundColor: kWhite, // Button background color
        ),
        onPressed: press as void Function()?, // Button press callback
        child: Text(text, style: tsB(size)), // Button text with style
      ),
    );
  }
}
