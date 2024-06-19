import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/common/widgets/icons/icon_circular.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class CustomAddAndRemoveButton extends StatelessWidget {
  const CustomAddAndRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomIconCircular(
          icon: Iconsax.minus,
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: THelperFunctions.isDarkMode(context)
              ? TColors.white
              : TColors.dark,
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Text(
          '2',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        const CustomIconCircular(
          icon: Iconsax.add,
          backgroundColor: TColors.primary,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: TColors.white,
        ),
      ],
    );
  }
}
