import 'package:get/get.dart';

import 'controller.dart';

class CloseAccountScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CloseAccountScreenController());
  }
}
