import 'package:get/get.dart';

import 'controller.dart';

class ProfileScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResourcsScreenController());
  }
}
