import 'package:flutter/material.dart';

import '../../../utils/constants/constants.dart';

class YearBox extends StatefulWidget {
  const YearBox({super.key});

  @override
  State<YearBox> createState() => _YearBoxState();
}

class _YearBoxState extends State<YearBox> {
  int selectedYear = 2024;
  final List<int> years = [2024, 2023, 2022, 2021];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.9,
      physics: NeverScrollableScrollPhysics(),
      children: years.map((year) {
        final isSelected = selectedYear == year;
        return GestureDetector(
          onTap: () => setState(() => selectedYear = year),
          child: Container(
            decoration: BoxDecoration(
              color: kWhite,
              border: Border.all(
                color: isSelected ? Colors.green : Colors.grey.shade300,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                if (isSelected)
                  BoxShadow(
                    color: Colors.green.withValues(alpha: 0.1),
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: isSelected
                      ? Icon(Icons.check_circle, color: Colors.green)
                      : Icon(Icons.radio_button_unchecked, color: Colors.grey),
                ),
                Text(year.toString(), style: tsBW(18, FontWeight.bold)),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
