import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/utils/constants/sizes.dart';

class RatingShareIcons extends StatelessWidget {
  const RatingShareIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Iconsax.star5,
              color: Colors.amber,
              size: 24,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems / 2,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: '5.0', style: Theme.of(context).textTheme.bodyMedium),
              const TextSpan(text: '(199)')
            ])),
          ],
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.share))
      ],
    );
  }
}
