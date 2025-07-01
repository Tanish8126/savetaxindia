import 'package:get/get.dart';

import 'controller.dart';

class TaxInputScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaxInputScreenController());
  }
}
