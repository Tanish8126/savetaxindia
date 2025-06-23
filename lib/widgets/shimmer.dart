import 'package:flutter/material.dart';

import '../utils/constants/constants.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key, required this.height, required this.width});
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight * height,
      width: SizeConfig.screenWidth * width,
      decoration: BoxDecoration(
          color: kWhite.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(15)),
    );
  }
}
