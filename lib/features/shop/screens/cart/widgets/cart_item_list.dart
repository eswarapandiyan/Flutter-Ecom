import 'package:flutter/material.dart';
import 'package:my_store/common/widgets/products/cart/add&remove_button.dart';
import 'package:my_store/common/widgets/products/cart/cart_item.dart';
import 'package:my_store/common/widgets/texts/custom_product_price.dart';
import 'package:my_store/utils/constants/sizes.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({
    super.key,
    this.showAddRemoveBtn = true,
  });
  final bool showAddRemoveBtn;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (_, __) => const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (_, index) {
          return Column(
            children: [
              const CustomCartItem(),
              if (showAddRemoveBtn)
                const SizedBox(
                  height: TSizes.spaceBtwItems / 2,
                ),
              if (showAddRemoveBtn)
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 70,
                        ),
                        CustomAddAndRemoveButton(),
                      ],
                    ),
                    Row(
                      children: [
                        CustomPricing(price: '259'),
                      ],
                    ),
                  ],
                ),
            ],
          );
        });
  }
}
