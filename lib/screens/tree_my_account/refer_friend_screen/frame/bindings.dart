import 'package:get/get.dart';

import 'controller.dart';

class ReferFriendScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReferFriendScreenController());
  }
}
