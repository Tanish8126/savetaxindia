import 'package:get/get.dart';

import 'state.dart';

class AYDropdownController extends GetxController {
  var selectedOption = 'File ITR for AY 2024-25'.obs;

  void onChangeOption(dynamic options) {
    selectedOption.value = options;
  }

  final state = AYDropdownState();
}
