import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/constants.dart';
import '../frame/controller.dart';

class Selector extends StatefulWidget {
  const Selector({
    required this.onTap,
    required this.title,
    required this.value,
    super.key,
  });

  final String title, value, onTap;

  @override
  State<Selector> createState() => _SelectorState();
}

class _SelectorState extends State<Selector> {
  final EmploymentTypeController employmentTypeController = Get.put(
    EmploymentTypeController(),
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(
          () => Radio(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            autofocus: true,
            value: widget.value,
            groupValue: employmentTypeController.selectedOption.value,
            activeColor: kWhite,
            onChanged: (value) {
              employmentTypeController.onChangeOption(value);
            },
          ),
        ),
        Text(widget.title, style: tsCommon(16, kWhite)),
      ],
    );
  }
}
