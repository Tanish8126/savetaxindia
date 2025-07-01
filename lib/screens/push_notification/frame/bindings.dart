import 'package:get/get.dart';

import 'controller.dart';

class PushNotificationScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PushNotificationScreenController());
  }
}
