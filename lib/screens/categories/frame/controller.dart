import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'index.dart';

class CategoriesController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late List<CategoriesModel> categoriesData;

  bool isLoading = true;

  void getData() async {
    await Future.wait([getCategoryData()]).then((value) {
      isLoading = false;
      update();
    });
  }

  Future<void> getCategoryData() async {
    await _firestore.collection('categories').get().then((value) {
      categoriesData =
          value.docs.map((e) => CategoriesModel.fromJson(e.data())).toList();
    });
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  final state = CategoriesState();
}
