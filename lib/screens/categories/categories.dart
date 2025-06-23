import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/constants.dart';
import '../../../../widgets/shimmer.dart';
import 'components/categories_input.dart';
import 'components/category_card.dart';
import 'frame/index.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoriesController());

    return Padding(
      padding: pds(0.02, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "What You're Looking For?",
            textAlign: TextAlign.left,
            style: tsB(18),
          ),
          sh01,
          GetBuilder<CategoriesController>(
            builder: (value) {
              if (!value.isLoading) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      controller.categoriesData.length,
                      (index) => CategoryCard(
                        image: categories[index]["image"],
                        text: controller.categoriesData[index].title,
                        press: categories[index]["onpress"],
                      ),
                    ),
                  ),
                );
              } else {
                return Padding(
                  padding: pds(0.02, 0),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShimmerEffect(height: 0.07, width: 0.15),
                      ShimmerEffect(height: 0.07, width: 0.15),
                      ShimmerEffect(height: 0.07, width: 0.15),
                      ShimmerEffect(height: 0.07, width: 0.15),
                      ShimmerEffect(height: 0.07, width: 0.15),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
