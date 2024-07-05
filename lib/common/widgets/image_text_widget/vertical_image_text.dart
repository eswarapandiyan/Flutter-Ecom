import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_store/common/widgets/images/custome_rounded_image.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class CustomeVerticalImages extends StatelessWidget {
  const CustomeVerticalImages({
    super.key,
    required this.title,
    required this.image,
    this.textColor = TColors.white,
    this.backgroundColor,
    required this.onTap,
    this.isNetWorkImage = true,
  });
  final String title, image;
  final Color textColor;
  final Color? backgroundColor;
  final VoidCallback onTap;
  final bool isNetWorkImage;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            // Container(
            //   height: 56,
            //   width: 56,
            //   padding: const EdgeInsets.all(TSizes.sm),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(100),
            //     color:
            //         backgroundColor ?? (dark ? TColors.black : TColors.white),
            //   ),
            //   child: Center(
            //     child: Image(
            //       image: AssetImage(image),
            //       fit: BoxFit.cover,
            //       color: dark ? TColors.light : TColors.dark,
            //     ),
            //   ),
            // ),
            CustomRoundedImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: TSizes.sm * 1.4,
              isNetworkImage: isNetWorkImage,
              backgroundColor: backgroundColor,
              overlayColor: dark ? TColors.light : TColors.dark,
            ),

            ///Text
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            SizedBox(
              width: 56,
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: TColors.white),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
