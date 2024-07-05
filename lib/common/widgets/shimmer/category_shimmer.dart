import 'package:flutter/material.dart';
import 'package:my_store/common/widgets/shimmer/shimmer_loader.dart';
import 'package:my_store/utils/constants/sizes.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key, this.itemCount = 6});
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        itemCount: itemCount,
        separatorBuilder: (_, __) => const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        itemBuilder: (_, __) => const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image
            CustomShimmerLoader(
              width: 56,
              height: 56,
              radius: 56,
            ),
            SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),

            //text
            CustomShimmerLoader(width: 56, height: 8),
          ],
        ),
      ),
    );
  }
}
