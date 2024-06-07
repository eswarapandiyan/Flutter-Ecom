import 'package:flutter/material.dart';

class CustomeSectionHeading extends StatelessWidget {
  const CustomeSectionHeading({
    super.key,
    this.textColor,
    required this.showActionBtn,
    required this.title,
    required this.buttonTitle,
    this.onPressed,
  });
  final Color? textColor;
  final bool showActionBtn;
  final String title, buttonTitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionBtn)
          TextButton(onPressed: onPressed, child: Text(buttonTitle))
      ],
    );
  }
}
