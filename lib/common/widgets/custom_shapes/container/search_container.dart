import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/device/device_utility.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class SearchBarContainer extends StatelessWidget {
  SearchBarContainer({
    super.key,
    this.onTap,
  });
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
        child: Container(
          width: TDeviceUtils.getScreenWidth(context),
          padding: EdgeInsets.all(TSizes.md),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
              color: dark ? Colors.transparent : TColors.white,
              border: Border.all(color: TColors.grey)),
          child: Row(
            children: [
              Icon(
                Iconsax.search_normal,
                color: dark ? TColors.white : TColors.black,
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              Text(
                'Search in store',
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}
