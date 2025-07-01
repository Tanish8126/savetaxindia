import 'package:get/get.dart';

import 'controller.dart';

class SubscriptionScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SubscriptionScreenController());
  }
}
