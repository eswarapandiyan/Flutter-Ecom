import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/common/widgets/appBar/appBar.dart';
import 'package:my_store/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:my_store/features/shop/screens/cart/cart.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/text_strings.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomeAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColors.grey),
          ),
          Text(
            TTexts.homeAppbarSubTitle,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: TColors.white),
          ),
        ],
      ),
      actions: [
        CartCounterIcon(
          onPressed: () => Get.to(const CartScreen()),
          color: TColors.white,
        )
      ],
    );
  }
}
