import 'package:get/get.dart';

import 'controller.dart';

class UploadFileScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UploadFileScreenController());
  }
}
