import 'package:get/get.dart';

// Mock CategoriesController for testing
class MockCategoriesController extends GetxController {
  List<Map<String, dynamic>> categoriesData = [
    {
      'title': 'Income Tax',
      'description': 'Calculate your income tax',
      'icon': 'tax_icon',
    },
    {'title': 'GST', 'description': 'Calculate GST', 'icon': 'gst_icon'},
    {'title': 'TDS', 'description': 'Calculate TDS', 'icon': 'tds_icon'},
  ];

  bool isLoading = false;

  @override
  void onInit() {
    // Simulate loading delay
    Future.delayed(const Duration(milliseconds: 100), () {
      isLoading = false;
      update();
    });
    super.onInit();
  }
}

// Mock state for CategoriesController
class MockCategoriesState {
  // Add any state properties needed for testing
}
