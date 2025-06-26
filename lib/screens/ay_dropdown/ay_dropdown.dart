import 'package:flutter/material.dart';

import '../../../utils/constants/constants.dart';

class AssessmentYearDropdown extends StatefulWidget {
  final List<String> years;
  final String? initialValue;
  final ValueChanged<String> onChanged;

  const AssessmentYearDropdown({
    super.key,
    required this.years,
    this.initialValue,
    required this.onChanged,
  });

  @override
  State<AssessmentYearDropdown> createState() => _AssessmentYearDropdownState();
}

class _AssessmentYearDropdownState extends State<AssessmentYearDropdown> {
  late String selectedYear;

  @override
  void initState() {
    super.initState();
    selectedYear = widget.initialValue ?? widget.years.first;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: selectedYear,
        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
          size: 28,
          color: kBlack,
        ),

        dropdownColor: kGrey,
        items: widget.years.map((String year) {
          return DropdownMenuItem<String>(
            value: year,
            child: Text(year, style: tsBW(22, FontWeight.bold)),
          );
        }).toList(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              selectedYear = newValue;
            });
            widget.onChanged(newValue);
          }
        },
        menuMaxHeight: 300,
      ),
    );
  }
}
