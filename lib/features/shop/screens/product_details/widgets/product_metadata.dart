import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:my_store/common/widgets/images/custome_image_banner.dart';
import 'package:my_store/common/widgets/images/custome_rounded_image.dart';
import 'package:my_store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:my_store/common/widgets/texts/custom_product_price.dart';
import 'package:my_store/common/widgets/texts/product_title.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/enums.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text(
                '25%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.black),
              ),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),

            /// Price
            Text(
              '\$250',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            const CustomPricing(price: '199', isLarge: true),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),

        /// Product Title
        const ProductTitleText(productTitle: 'Green Nike sports Shirt'),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),

        /// Product Status
        Row(
          children: [
            const ProductTitleText(productTitle: 'Status'),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              'In Stock',
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),

        /// Brand
        Row(
          children: [
            CustomRoundedImage(
              image: TImages.shoeIcon,
              width: 32,
              height: 32,
              overlayColor: THelperFunctions.isDarkMode(context)
                  ? TColors.white
                  : TColors.dark,
            ),
            const Expanded(
                child: BrandTitleWithVerifiedIcon(
              title: 'Nike',
              brandTextSize: TextSizes.medium,
            ))
          ],
        )
      ],
    );
  }
}
