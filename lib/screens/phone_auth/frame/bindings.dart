import 'package:get/get.dart';

import 'controller.dart';

class PhoneAuthBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PhoneAuthController());
  }
}
