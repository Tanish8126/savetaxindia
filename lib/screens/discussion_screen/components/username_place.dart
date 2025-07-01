import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constants/constants.dart';

class UserNamePlace extends StatelessWidget {
  const UserNamePlace({super.key, required this.userName, required this.place});
  final String userName, place;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(userName, style: tsBW(15, FontWeight.w700)),
        sw07,
        TextButton.icon(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/gps.svg",
            height: 16.h,
            colorFilter: ColorFilter.mode(kBlack, BlendMode.srcIn),
          ),
          label: Text(place, style: tsCommonW(15, FontWeight.w700, kBlack)),
        ),
      ],
    );
  }
}
