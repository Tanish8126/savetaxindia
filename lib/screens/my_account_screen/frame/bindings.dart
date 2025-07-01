import 'package:get/get.dart';

import 'controller.dart';

class MyAccountScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyAccountScreenController());
  }
}
