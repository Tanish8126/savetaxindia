import 'package:get/get.dart';

import 'controller.dart';

class DiscussionScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DiscussionScreenController());
  }
}
