import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/common/styles/shadows.dart';
import 'package:my_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:my_store/common/widgets/icons/icon_circular.dart';
import 'package:my_store/common/widgets/images/custome_image_banner.dart';
import 'package:my_store/common/widgets/texts/product_title.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class CustomProductVertical extends StatelessWidget {
  const CustomProductVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    ///container with side padding,color,edges,radius and shadow
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [CustomShadowsStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            color: dark ? TColors.darkerGrey : TColors.white),
        child: Column(
          ///Thumb nail,WhishList button,discount tag
          children: [
            CustomRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroungColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  /// Thumbnail image
                  const CustomeBannerImages(
                    imageUrl: TImages.productImage1,
                  ),

                  /// discount tag
                  Positioned(
                    top: 12,
                    child: CustomRoundedContainer(
                      radius: TSizes.sm,
                      backgroungColor: TColors.secondary.withOpacity(0.8),
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
                  ),

                  /// WhishList button
                  const Positioned(
                      top: 0,
                      right: 0,
                      child: CustomIconCircular(
                          icon: Iconsax.heart5, color: Colors.red)),
                ],
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),

            /// details
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                children: [
                  const ProductTitleText(
                    productTitle: 'Green Nike air shoes',
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  Row(
                    children: [
                      Text(
                        'Nike',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const Icon(
                        Iconsax.verify5,
                        color: TColors.primary,
                        size: TSizes.iconXs,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$35.5',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: TColors.dark,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(TSizes.cardRadiusMd),
                                bottomRight: Radius.circular(
                                    TSizes.productImageRadius))),
                        child: const SizedBox(
                            width: TSizes.iconLg * 1.2,
                            height: TSizes.iconLg * 1.2,
                            child: Center(
                                child: Icon(
                              Iconsax.add,
                              color: TColors.white,
                            ))),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
