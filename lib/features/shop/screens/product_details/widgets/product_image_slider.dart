import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/common/widgets/appBar/appBar.dart';
import 'package:my_store/common/widgets/custom_shapes/curved_edges.dart/curved_edges_widget.dart';
import 'package:my_store/common/widgets/icons/icon_circular.dart';
import 'package:my_store/common/widgets/images/custome_image_banner.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/constants/sizes.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return CustomCurvedWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            /// Larger Image
            const SizedBox(
              height: 350,
              child: Padding(
                padding: EdgeInsets.all(TSizes.productImageRadius),
                child: Center(
                    child: Image(image: AssetImage(TImages.productImage5))),
              ),
            ),

            /// Slider Image
            Positioned(
              bottom: 20,
              right: 0,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  separatorBuilder: (_, __) => const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => CustomeBannerImages(
                    imageUrl: TImages.productImage3,
                    width: 80,
                    backgroundColor: dark ? TColors.dark : TColors.light,
                    padding: EdgeInsets.all(TSizes.sm),
                    boxBorder: Border.all(color: TColors.primary),
                  ),
                ),
              ),
            ),

            /// App bar
            const CustomeAppBar(
              showBackArrow: true,
              actions: [
                CustomIconCircular(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
