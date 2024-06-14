import 'package:flutter/material.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class CustomRoundedImage extends StatelessWidget {
  const CustomRoundedImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.height = 56,
    this.width = 56,
    this.padding = TSizes.sm,
    this.onTap,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double? height, width, padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(padding!),
        decoration: BoxDecoration(
          color: backgroundColor ??
              (THelperFunctions.isDarkMode(context)
                  ? TColors.black
                  : TColors.white),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Image(
            image: isNetworkImage
                ? NetworkImage(image)
                : AssetImage(image) as ImageProvider,
            color: overlayColor,
            fit: fit,
          ),
        ),
      ),
    );
  }
}
