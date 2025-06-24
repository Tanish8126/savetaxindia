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
          Row(
            children: [
              Icon(Icons.explore, color: Colors.green.shade700, size: 24),
              const SizedBox(width: 8),
              Text(
                "What You're Looking For?",
                textAlign: TextAlign.left,
                style: tsB(18).copyWith(color: Colors.green.shade900),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
            child: GetBuilder<CategoriesController>(
              builder: (value) {
                if (!value.isLoading) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: List.generate(
                        controller.categoriesData.length,
                        (index) => CategoryCard(
                          image: categories[index]["image"],
                          text: categories[index]["text"],
                          // text: controller.categoriesData[index].title,
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
          ),
          const SizedBox(height: 8),
          Divider(thickness: 1, color: Colors.green.shade100),
        ],
      ),
    );
  }
}
