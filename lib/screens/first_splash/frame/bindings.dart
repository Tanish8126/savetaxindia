import 'package:get/get.dart';

import 'controller.dart';

class FirstSplashBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FirstSplashController());
  }
}
