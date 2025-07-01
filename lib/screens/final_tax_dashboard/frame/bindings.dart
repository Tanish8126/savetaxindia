import 'package:get/get.dart';

import 'controller.dart';

class FinalTaxDashboardScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FinalTaxDashboardScreenController());
  }
}
