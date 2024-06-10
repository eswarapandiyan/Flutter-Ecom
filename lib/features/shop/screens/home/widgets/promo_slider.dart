import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:my_store/common/widgets/images/custome_image_banner.dart';
import 'package:my_store/features/shop/controller/home_controller.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
    required this.banners,
  });
  final List<String> banners;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
          items:
              banners.map((url) => CustomeBannerImages(imageUrl: url)).toList(),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < banners.length; i++)
                CircularWidget(
                  width: 20,
                  height: 4,
                  margin: const EdgeInsets.only(right: 10),
                  backgroungColor: controller.carousalCurrentIndex.value == i
                      ? TColors.primary
                      : TColors.grey,
                )
            ],
          ),
        )
      ],
    );
  }
}
