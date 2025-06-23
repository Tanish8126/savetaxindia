import 'package:get/get.dart';

import 'controller.dart';

class EmploymentTypeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmploymentTypeController());
  }
}
