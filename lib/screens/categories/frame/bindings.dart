import 'package:get/get.dart';

import 'controller.dart';

class CategoriesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoriesController());
  }
}
