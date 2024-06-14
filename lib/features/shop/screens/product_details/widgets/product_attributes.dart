import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_store/common/widgets/chips/choice_chip.dart';
import 'package:my_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:my_store/common/widgets/texts/custom_product_price.dart';
import 'package:my_store/common/widgets/texts/custome_section_heading.dart';
import 'package:my_store/common/widgets/texts/product_title.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomRoundedContainer(
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.grey,
          padding: EdgeInsets.all(TSizes.md),
          child: Column(
            children: [
              Row(
                children: [
                  const CustomeSectionHeading(
                    title: 'Variations',
                    showActionBtn: false,
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Column(
                    children: [
                      /// Pricing Variartion
                      Row(
                        children: [
                          const ProductTitleText(
                            productTitle: 'price :',
                            smallSize: true,
                          ),
                          Text('\$25',
                              style:
                                  Theme.of(context).textTheme.titleSmall!.apply(
                                        decoration: TextDecoration.lineThrough,
                                      )),
                          const SizedBox(
                            width: TSizes.spaceBtwItems / 1.5,
                          ),
                          const CustomPricing(price: '20')
                        ],
                      ),

                      /// Stock Variation
                      Row(
                        children: [
                          const ProductTitleText(
                            productTitle: 'Stock :',
                            smallSize: true,
                          ),
                          Text(' In stock',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      )
                    ],
                  )
                ],
              ),
              const ProductTitleText(
                productTitle:
                    'This is the description of the product and it can go upto max 4 lines',
                smallSize: true,
                maxLine: 4,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Colors
            const CustomeSectionHeading(
              title: 'Colors',
              showActionBtn: false,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Wrap(
              spacing: 8,
              children: [
                CustomChoiceChip(
                  label: 'Green',
                  selected: true,
                  onSelected: (value) {},
                ),
                CustomChoiceChip(
                  label: 'Blue',
                  selected: false,
                  onSelected: (value) {},
                ),
                CustomChoiceChip(
                  label: 'Yellow',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        /// --Sizes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomeSectionHeading(
              title: 'Sizes',
              showActionBtn: false,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Wrap(
              spacing: 8,
              children: [
                CustomChoiceChip(
                  label: 'EU 36',
                  selected: true,
                  onSelected: (value) {},
                ),
                CustomChoiceChip(
                  label: 'EU 38',
                  selected: false,
                  onSelected: (value) {},
                ),
                CustomChoiceChip(
                  label: 'EU 40',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
