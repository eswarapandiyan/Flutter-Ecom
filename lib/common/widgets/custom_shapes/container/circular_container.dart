import 'package:flutter/material.dart';
import 'package:my_store/utils/constants/colors.dart';

class CircularWidget extends StatelessWidget {
  const CircularWidget({
    super.key,
    this.width = 400,
    this.height = 400,
    this.padding = 0,
    this.radius = 400,
    this.child,
    this.backgroungColor = TColors.white,
    this.margin,
  });
  final double? width;
  final double? height;
  final double padding;
  final double radius;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroungColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(400),
        color: backgroungColor,
      ),
    );
  }
}
