import 'package:flutter/material.dart';
import 'package:my_store/features/authentication/controller/onboarding/onboarding_controller.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/device/device_utility.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      right: TSizes.defaultSpace,
      child: FloatingActionButton(
        onPressed: () {
          OnBoardingController.instance.nextPage();
        },
        child: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}
