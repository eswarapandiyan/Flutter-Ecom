import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_store/common/widgets/appBar/appBar.dart';
import 'package:my_store/common/widgets/images/custome_image_banner.dart';
import 'package:my_store/common/widgets/products/product_cards/product_cards_horizontal.dart';
import 'package:my_store/common/widgets/texts/custome_section_heading.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(
        title: Text(
          'Sports',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// promo banner
              const CustomeBannerImages(
                imageUrl: TImages.banner3,
                width: double.infinity,
                applyImageRadius: true,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Sub categories
              Column(
                children: [
                  const CustomeSectionHeading(
                    title: 'Sports Shirts',
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        separatorBuilder: (_, __) => const SizedBox(
                              width: TSizes.spaceBtwItems,
                            ),
                        itemCount: 4,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) =>
                            const CustomProductHorizontal()),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
