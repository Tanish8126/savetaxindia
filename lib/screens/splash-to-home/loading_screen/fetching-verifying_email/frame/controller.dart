import 'dart:async';

import 'package:get/get.dart';

class LoadingEmailController extends GetxController {
  LoadingEmailController();

  RxDouble percent = 0.0.obs;
  late Timer timer;

  @override
  void onInit() {
    super.onInit();

    time();
  }

  @override
  void onClose() {
    super.onClose();

    time();
  }

  //Indicator Percent
  void time() {
    timer = Timer.periodic(const Duration(milliseconds: 50), (_) {
      percent.value += 10;
      if (percent >= 100) {
        timer.cancel();
        percent.value = 0;
      }
    });
  }
}
