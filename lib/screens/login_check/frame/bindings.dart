import 'package:get/get.dart';

import 'controller.dart';

class LoginCheckBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginCheckController());
  }
}
