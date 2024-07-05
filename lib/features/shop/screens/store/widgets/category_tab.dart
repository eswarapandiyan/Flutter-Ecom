import 'package:flutter/cupertino.dart';
import 'package:my_store/common/widgets/brands/brand_showcase.dart';
import 'package:my_store/common/widgets/layout/grid_layout.dart';
import 'package:my_store/common/widgets/products/product_cards/product_cards_vertical.dart';
import 'package:my_store/common/widgets/texts/custome_section_heading.dart';
import 'package:my_store/features/shop/model/category/category_model.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    super.key,
    required this.category,
  });
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Brands
                  const CustomBrandShowCase(
                    images: [
                      TImages.productImage1,
                      TImages.productImage2,
                      TImages.productImage3
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  /// Products
                  CustomeSectionHeading(
                    title: 'You might like',
                    showActionBtn: true,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  CustomGridLayout(
                      itemCount: 4,
                      itemBuilder: (_, index) => const CustomProductVertical())
                ],
              )),
        ]);
  }
}
