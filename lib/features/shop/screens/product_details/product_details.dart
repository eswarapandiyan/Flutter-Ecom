import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/common/widgets/texts/custome_section_heading.dart';
import 'package:my_store/features/shop/screens/product_details/widgets/bottom_add_to_cart_navigation.dart';
import 'package:my_store/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:my_store/features/shop/screens/product_details/widgets/product_image_slider.dart';
import 'package:my_store/features/shop/screens/product_details/widgets/product_metadata.dart';
import 'package:my_store/features/shop/screens/product_details/widgets/rating_share.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product image slider
            ProductImageSlider(dark: dark),

            /// Product details
            Padding(
              padding: const EdgeInsets.only(
                  left: TSizes.defaultSpace,
                  right: TSizes.defaultSpace,
                  // bottom: TSizes.defaultSpace,
                  top: TSizes.defaultSpace / 2),
              child: Column(
                children: [
                  /// Rating,Share Icons
                  const RatingShareIcons(),

                  /// Price,Stock,title and brand
                  const ProductMetaData(),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  /// Product Atributes
                  const ProductAttributes(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// Checkout button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Checkout')),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// Description
                  const CustomeSectionHeading(
                    title: 'Description',
                    showActionBtn: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const ReadMoreText(
                    'Designed for comfortable wear for sports and street style, NIKE is always fun to wear. Upgrade in style with a wide range from the world’s leading and much-loved sports brand, NIKE.',
                    trimLines: 3,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  const Divider(),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  /// Reviews
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomeSectionHeading(
                        title: 'Reviews(199)',
                        showActionBtn: false,
                      ),
                      IconButton(
                          onPressed: () {}, icon: Icon(Iconsax.arrow_right_3))
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
