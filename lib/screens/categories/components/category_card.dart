import 'package:flutter/material.dart';

import '../../../../../utils/constants/constants.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.image,
    required this.text,
    required this.press,
  });

  final String image, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        child: Column(
          children: [
            Container(
              margin: pdo(0, 0, 0, 0.02),
              height: SizeConfig.screenHeight * 0.08,
              width: SizeConfig.screenHeight * 0.08,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(image, fit: BoxFit.fill),
              ),
            ),
            sh01,
            Text(text, textAlign: TextAlign.center, style: tsB(14)),
          ],
        ),
      ),
    );
  }
}
