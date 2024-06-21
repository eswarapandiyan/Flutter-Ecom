import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/common/widgets/loaders/animation_loader.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class TScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => PopScope(
            canPop: false,
            child: Container(
              color: THelperFunctions.isDarkMode(Get.context!)
                  ? TColors.dark
                  : TColors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(
                    height: 250,
                  ),
                  CustomAnimationLoader(animation: animation, text: text),
                ],
              ),
            )));
  }

  static void stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
