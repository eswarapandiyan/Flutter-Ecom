import 'package:flutter/material.dart';
import 'package:my_store/utils/constants/colors.dart';

class CustomShadowsStyle {
  static final verticalProductShadow = BoxShadow(
    color: TColors.darkGrey.withOpacity(0.1),
    blurRadius: 25,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  static final horizontalProductShadow = BoxShadow(
    color: TColors.darkGrey.withOpacity(0.1),
    // blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}
