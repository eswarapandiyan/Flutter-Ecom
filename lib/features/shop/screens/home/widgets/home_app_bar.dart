import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:my_store/common/widgets/appBar/appBar.dart';
import 'package:my_store/common/widgets/loaders/shimmer_loader.dart';
import 'package:my_store/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:my_store/features/personalization/controller/user/user_controller.dart';
import 'package:my_store/features/shop/screens/cart/cart.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/text_strings.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
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
          Obx(() {
            if (controller.profileLoading.value) {
              return const CustomShimmerLoader(width: 80, height: 15);
            } else {
              return Text(
                controller.user.value.fullName,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: TColors.white),
              );
            }
          }),
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
