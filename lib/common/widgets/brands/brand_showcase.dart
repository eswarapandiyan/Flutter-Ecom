import 'package:flutter/material.dart';
import 'package:my_store/common/widgets/brands/custom_brand_grid.dart';
import 'package:my_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class CustomBrandShowCase extends StatelessWidget {
  const CustomBrandShowCase({
    super.key,
    required this.images,
  });
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      showBorder: true,
      borderColor: TColors.grey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      padding: const EdgeInsets.all(TSizes.md),
      child: Column(
        children: [
          /// Brand with product count
          CustomBrandGrid(
            showBorder: false,
            onTap: () {},
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          /// Brand top 3 product images
          Row(
            children: images
                .map((image) => BrandTopProductImageWidget(context, image))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget BrandTopProductImageWidget(BuildContext context, String image) {
    return Expanded(
      child: CustomRoundedContainer(
        height: 100,
        backgroundColor: THelperFunctions.isDarkMode(context)
            ? TColors.darkerGrey
            : TColors.light,
        margin: const EdgeInsets.only(right: TSizes.sm),
        padding: const EdgeInsets.all(TSizes.md),
        child: Image(
          image: AssetImage(image),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
