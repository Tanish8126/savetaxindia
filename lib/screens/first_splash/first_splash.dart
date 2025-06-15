import 'package:flutter/material.dart';

import '../../utils/constants/constants.dart';
import 'components/body.dart';

class FirstSplash extends StatelessWidget {
  const FirstSplash({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(body: Body());
  }
}
