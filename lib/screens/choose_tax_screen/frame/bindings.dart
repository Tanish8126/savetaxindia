import 'package:get/get.dart';

import 'controller.dart';

class ChooseTaxScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChooseTaxScreenController());
  }
}
