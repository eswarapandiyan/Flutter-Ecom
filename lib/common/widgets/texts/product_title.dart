import 'package:flutter/material.dart';
// import 'package:my_store/utils/helpers/helper_functions.dart';

class ProductTitleText extends StatelessWidget {
  const ProductTitleText({
    super.key,
    required this.productTitle,
    this.maxLine = 2,
    this.textAlign = TextAlign.center,
    this.smallSize = true,
  });
  final String productTitle;
  final int? maxLine;
  final TextAlign textAlign;
  final bool smallSize;

  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          productTitle,
          overflow: TextOverflow.ellipsis,
          maxLines: maxLine,
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
