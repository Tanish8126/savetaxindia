import 'package:get/get.dart';

import 'state.dart';

class EmploymentTypeController extends GetxController {
  var selectedOption = 'Employment'.obs;

  void onChangeOption(dynamic options) {
    selectedOption.value = options;
  }

  final state = EmploymentTypeState();
}
