import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:my_store/features/authentication/screens/onboarding/widgets/onboarding_circular_btn.dart';
import 'package:my_store/features/authentication/screens/onboarding/widgets/onboarding_nav.dart';
import 'package:my_store/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:my_store/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/constants/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  final controller = Get.put(OnBoardingController());

  OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ///Horizontal Scroll View page
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subtitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subtitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subtitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          ///Skip button
          const onBoardingSkip(),

          ///Dotted navigation button
          const OnBoardingDotNavigation(),

          ///Circular button
          const CircularButton()
        ],
      ),
    );
  }
}
