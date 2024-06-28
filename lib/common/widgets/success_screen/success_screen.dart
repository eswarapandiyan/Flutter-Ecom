import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_store/common/styles/spacing_styles.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/constants/text_strings.dart';

class SuccessScreen extends StatelessWidget {
  final String image, title, subtitle;
  final VoidCallback onPressed;
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight,
          child: Column(children: [
            Lottie.asset(image, width: MediaQuery.of(context).size.width * 0.6),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            /// title and Subtitleā
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            Text(
              subtitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),

            /// continue button
            const SizedBox(height: TSizes.spaceBtwSections),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: onPressed, child: const Text(TTexts.tContinue))),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
          ]),
        ),
      ),
    );
  }
}
