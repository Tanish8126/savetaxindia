import 'package:get/get.dart';

import 'controller.dart';

class EditProfileScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditProfileScreenController());
  }
}
