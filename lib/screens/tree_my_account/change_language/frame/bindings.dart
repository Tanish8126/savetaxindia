import 'package:get/get.dart';

import 'controller.dart';

class ChangeLanguageScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangeLanguageScreenController());
  }
}
