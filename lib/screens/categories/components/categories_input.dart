import 'package:get/get.dart';

import '../../discussion_screen.dart';
import '../../expat_dashboard.dart';
import '../../final_tax_dashboard/final_tax_dashboard.dart';
import '../../tax_summary.dart';

List<Map<String, dynamic>> categories = [
  {
    "image": "assets/images/goops.png",
    "text": "File ITR",
    "onpress": () {
      Get.toNamed(TaxSummaryScreen.routeName);
    },
  },
  {
    "image": "assets/images/goops.png",
    "text": "Discussion",
    "onpress": () {
      Get.toNamed(DiscussionScreen.routeName);
    },
  },
  {
    "image": "assets/images/goops.png",
    "text": "Resources",
    "onpress": () {
      Get.toNamed(ExpatFileDashboard.routeName);
    },
  },
  {
    "image": "assets/images/goops.png",
    "text": "Expert",
    "onpress": () {
      Get.toNamed(TaxDashboardScreen.routeName);
    },
  },
];
