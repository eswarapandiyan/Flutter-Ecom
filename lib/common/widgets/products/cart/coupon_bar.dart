import 'package:flutter/material.dart';
import 'package:my_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class CustomCouponBar extends StatelessWidget {
  const CustomCouponBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return CustomRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? TColors.dark : TColors.white,
      padding: const EdgeInsets.only(
          top: TSizes.sm, right: TSizes.md, bottom: TSizes.sm, left: TSizes.sm),

      /// Text field
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a promo code ? Enter here',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
              ),
            ),
          ),

          /// Button
          SizedBox(
              width: 70,
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    foregroundColor: dark
                        ? TColors.white.withOpacity(0.5)
                        : TColors.dark.withOpacity(0.5),
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    side: BorderSide(color: Colors.grey.withOpacity(0.1))),
                child: Text(
                  'Apply',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ))
        ],
      ),
    );
  }
}
