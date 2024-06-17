import 'package:flutter/material.dart';
import 'package:my_store/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip({
    super.key,
    required this.label,
    required this.selected,
    this.onSelected,
  });
  final String label;
  final bool selected;
  final void Function(bool)? onSelected;
  @override
  Widget build(BuildContext context) {
    final isColor = THelperFunctions.getColor(label);
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor != null ? const SizedBox() : Text(label),
        selected: selected,
        onSelected: onSelected,
        labelStyle: const TextStyle(color: true ? TColors.light : null),
        avatar: isColor != null
            ? CircularWidget(
                height: 50,
                width: 50,
                backgroungColor: THelperFunctions.getColor(label)!)
            : null,
        shape: isColor != null ? const CircleBorder() : null,
        labelPadding: isColor != null ? const EdgeInsets.all(0) : null,
        padding: isColor != null ? const EdgeInsets.all(0) : null,
        backgroundColor:
            isColor != null ? THelperFunctions.getColor(label) : null,
      ),
    );
  }
}
