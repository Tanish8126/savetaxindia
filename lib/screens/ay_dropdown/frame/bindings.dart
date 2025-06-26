import 'package:get/get.dart';

import 'controller.dart';

class AYDropdownBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AYDropdownController());
  }
}
