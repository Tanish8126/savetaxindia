import 'package:get/get.dart';

import 'controller.dart';

class HireExpertScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HireExpertScreenController());
  }
}
