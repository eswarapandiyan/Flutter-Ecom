import 'package:flutter/material.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';

class CustomeBannerImages extends StatelessWidget {
  const CustomeBannerImages({
    super.key,
    this.height,
    this.width,
    this.boxfit = BoxFit.contain,
    required this.imageUrl,
    this.boxBorder,
    this.applyImageRadius = true,
    this.backgroundColor = TColors.light,
    this.borderRadius = TSizes.md,
    this.onPressed,
    this.isNetworkImage = false,
  });

  final double? height, width;
  final BoxFit? boxfit;
  final String imageUrl;
  final BoxBorder? boxBorder;
  final bool applyImageRadius;
  final Color? backgroundColor;
  final double? borderRadius;
  final VoidCallback? onPressed;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius!),
              color: backgroundColor,
              border: boxBorder),
          child: ClipRRect(
              borderRadius: applyImageRadius
                  ? BorderRadius.circular(TSizes.md)
                  : BorderRadius.zero,
              child: Image(
                  image: isNetworkImage
                      ? NetworkImage(imageUrl)
                      : AssetImage(imageUrl) as ImageProvider,
                  fit: boxfit)),
        ),
      ),
    );
  }
}
