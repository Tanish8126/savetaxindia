// This widget provides a shimmer effect placeholder, typically used while loading content.
import 'package:flutter/material.dart';

import '../utils/constants/constants.dart';

// Stateless widget for shimmer effect
class ShimmerEffect extends StatelessWidget {
  // Constructor requires height and width for the shimmer box
  const ShimmerEffect({super.key, required this.height, required this.width});
  // Height and width of the shimmer box (as a fraction of screen size)
  final double height, width;

  @override
  Widget build(BuildContext context) {
    // Returns a container with shimmer effect styling
    return Container(
      height: SizeConfig.screenHeight * height, // Set height relative to screen
      width: SizeConfig.screenWidth * width, // Set width relative to screen
      decoration: BoxDecoration(
        color: kWhite.withValues(alpha: 0.3), // Semi-transparent white color
        borderRadius: BorderRadius.circular(15),
      ), // Rounded corners
    );
  }
}
