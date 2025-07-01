import 'package:get/get.dart';

import 'controller.dart';

class NotificationScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationScreenController());
  }
}
