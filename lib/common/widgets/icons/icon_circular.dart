import 'package:flutter/material.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class CustomIconCircular extends StatelessWidget {
  const CustomIconCircular({
    super.key,
    this.width,
    this.height,
    this.size = TSizes.lg,
    this.onPressed,
    required this.icon,
    this.color,
    this.backgroundColor,
  });

  final double? width, height, size;
  final VoidCallback? onPressed;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null
            ? backgroundColor!
            : THelperFunctions.isDarkMode(context)
                ? TColors.black.withOpacity(0.9)
                : TColors.white.withOpacity(0.9),
      ),
      child: IconButton(
        icon: Icon(
          icon,
          size: size,
        ),
        onPressed: () {},
        color: color,
      ),
    );
  }
}
