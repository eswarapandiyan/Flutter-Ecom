import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:my_store/common/widgets/texts/custome_section_heading.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class AmountPaymentSection extends StatelessWidget {
  const AmountPaymentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        CustomeSectionHeading(
          title: 'Payment method',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        // const SizedBox(
        //   height: TSizes.spaceBtwItems / 2,
        // ),
        Row(
          children: [
            CustomRoundedContainer(
              backgroundColor: dark ? Colors.transparent : TColors.white,
              padding: EdgeInsets.all(TSizes.sm),
              width: 35,
              height: 60,
              child: const Image(
                  image: AssetImage(TImages.paypal), fit: BoxFit.contain),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems / 2,
            ),
            Text(
              'Paypal',
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ],
    );
  }
}
