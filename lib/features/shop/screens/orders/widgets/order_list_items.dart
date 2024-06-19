import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (_, __) => const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (_, index) {
          return CustomRoundedContainer(
            showBorder: true,
            backgroundColor: THelperFunctions.isDarkMode(context)
                ? TColors.dark
                : TColors.light,
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Row-1
                Row(
                  children: [
                    /// Icon
                    const Icon(
                      Iconsax.ship,
                    ),
                    const SizedBox(
                      width: TSizes.spaceBtwItems / 2,
                    ),

                    /// date
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Processing',
                            style: Theme.of(context).textTheme.bodyLarge!.apply(
                                color: TColors.primary, fontWeightDelta: 1),
                          ),
                          const SizedBox(
                            height: TSizes.spaceBtwItems / 2,
                          ),
                          Text(
                            '01 Sep 2023',
                            style: Theme.of(context).textTheme.headlineSmall,
                          )
                        ],
                      ),
                    ),

                    /// icon
                    IconButton(
                      icon: const Icon(
                        Iconsax.arrow_right_34,
                        size: TSizes.iconSm,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),

                /// Row-2
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          /// Icon
                          const Icon(
                            Iconsax.tag,
                          ),
                          const SizedBox(
                            width: TSizes.spaceBtwItems / 2,
                          ),

                          /// date
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Orders',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .apply(color: TColors.darkGrey),
                                ),
                                Text(
                                  '#X2034X',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          /// Icon
                          const Icon(
                            Iconsax.calendar,
                            // size: 30,
                          ),
                          const SizedBox(
                            width: TSizes.spaceBtwItems / 2,
                          ),

                          /// date
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Shipping date',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .apply(color: TColors.darkGrey),
                                ),
                                Text(
                                  '10 Sep 2023',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
