import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/common/widgets/image_text_widget/vertical_image_text.dart';
import 'package:my_store/common/widgets/shimmer/category_shimmer.dart';
import 'package:my_store/features/shop/controller/category_controller.dart';
import 'package:my_store/features/shop/screens/sub_categories/sub_categories.dart';
import 'package:my_store/utils/constants/colors.dart';

class CustomeHomeCategories extends StatelessWidget {
  const CustomeHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Obx(() {
      if (controller.isLoading.value) {
        return const CategoryShimmer();
      }
      if (controller.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            'No data Found',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: TColors.white),
          ),
        );
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final category = controller.featuredCategories[index];
              print(category.name);
              return CustomeVerticalImages(
                // isNetWorkImage: true,
                title: category.name,
                image: category.image,
                onTap: () => Get.to(const SubCategoriesScreen()),
              );
            }),
      );
    });
  }
}
