import 'package:get/get.dart';

import 'controller.dart';

class EditIncomeScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditIncomeScreenController());
  }
}
