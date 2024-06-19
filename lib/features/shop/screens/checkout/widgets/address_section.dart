import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_store/common/widgets/texts/custome_section_heading.dart';
import 'package:my_store/utils/constants/sizes.dart';

class AddressPaymentSection extends StatelessWidget {
  const AddressPaymentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomeSectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Text(
          'Coding with Eswar',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            const Icon(
              Icons.phone,
              size: 20,
              color: Colors.grey,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              '+91-9876543210',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            const Icon(
              Icons.location_history,
              size: 20,
              color: Colors.grey,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Flexible(
              child: Text(
                'No.339 ellai ammn kovil St, Nagavedu,Arakkonam-631002',
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
              ),
            )
          ],
        )
      ],
    );
  }
}
