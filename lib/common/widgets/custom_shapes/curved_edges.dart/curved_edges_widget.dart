import 'package:flutter/material.dart';
import 'package:my_store/common/widgets/custom_shapes/curved_edges.dart/curved_edges.dart';

class CustomCurvedWidget extends StatelessWidget {
  const CustomCurvedWidget({
    super.key,
    this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: CustomCurvedEdges(), child: child);
  }
}
