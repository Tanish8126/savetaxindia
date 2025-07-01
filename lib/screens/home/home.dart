import 'package:flutter/material.dart';

import '../../utils/constants/constants.dart';
import 'components/home_body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = './home.dart';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //==================Screen Size Initialization==================
    SizeConfig.init(context);
    return SafeArea(child: Scaffold(body: const HomeBody()));
  }
}
