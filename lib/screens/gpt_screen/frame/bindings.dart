import 'package:get/get.dart';

import 'controller.dart';

class GptScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GptScreenController());
  }
}
