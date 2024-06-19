import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:my_store/common/widgets/custom_shapes/container/search_container.dart';
import 'package:my_store/common/widgets/layout/grid_layout.dart';
import 'package:my_store/common/widgets/products/product_cards/product_cards_vertical.dart';
import 'package:my_store/common/widgets/texts/custome_section_heading.dart';
import 'package:my_store/features/shop/screens/all_products/all_products.dart';
import 'package:my_store/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:my_store/features/shop/screens/home/widgets/home_category.dart';
import 'package:my_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Blue container
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  /// Home App bar
                  const HomeAppBar(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// Search bar
                  SearchBarContainer(
                    onTap: () {},
                    text: 'Search Products',
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        CustomeSectionHeading(
                          showActionBtn: false,
                          title: 'Product Categories',
                          buttonTitle: 'View all',
                          textColor: TColors.white,
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),

                        ///Categories list
                        CustomeHomeCategories(),
                        SizedBox(
                          height: TSizes.spaceBtwSections,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            ///body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),

              /// Prmo slider
              child: Column(
                children: [
                  const PromoSlider(
                    banners: [
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  /// Heading
                  CustomeSectionHeading(
                    title: 'Popular products',
                    onPressed: () => Get.to(const AllProductScreen()),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  /// Popular products
                  CustomGridLayout(
                    itemCount: 2,
                    itemBuilder: (_, index) => const CustomProductVertical(),
                  ),
                ],
              ),

              /// Product List
            ),
          ],
        ),
      ),
    );
  }
}
