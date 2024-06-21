import 'package:flutter/material.dart';
import 'package:my_store/features/authentication/controller/onboarding/onboarding_controller.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/device/device_utility.dart';

class onBoardingSkip extends StatelessWidget {
  const onBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceUtils.getAppBarHeight(),
        right: TSizes.defaultSpace,
        child: TextButton(
            onPressed: () {
              OnBoardingController.instance.skipPage();
            },
            child: const Text('Skip')));
  }
}
