import 'package:get/get.dart';

import 'controller.dart';

class SecondSplashBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SecondSplashController());
  }
}
