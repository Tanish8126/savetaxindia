import 'package:flutter/material.dart';
import 'package:savetaxindia/screens/home/home.dart';

import '../../../utils/constants/constants.dart';

import 'components/selector.dart';

class EmploymentType extends StatelessWidget {
  const EmploymentType({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: SizeConfig.screenHeight * 0.05,
          width: SizeConfig.screenWidth * 0.90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.green.shade700,
          ),
          child: Padding(
            padding: pdo(0, 0, 0, 0),
            child: Row(
              children: [
                Selector(
                  onTap: HomeScreen.routeName,
                  title: "Government",
                  value: "Government",
                ),
                Selector(
                  onTap: HomeScreen.routeName,
                  title: "Private",
                  value: "Private",
                ),
                Selector(
                  onTap: HomeScreen.routeName,
                  title: "PSU",
                  value: "PSU",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
