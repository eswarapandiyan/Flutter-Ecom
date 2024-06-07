import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/common/widgets/login_page/divider.dart';
import 'package:my_store/common/widgets/login_page/social_icons.dart';
import 'package:my_store/features/authentication/screens/register/verify_email.dart';
import 'package:my_store/features/authentication/screens/register/widgets/register_form.dart';
import 'package:my_store/features/authentication/screens/register/widgets/terms&conditions.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/constants/text_strings.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              const Row(
                children: [
                  /// FN
                  Expanded(
                    child: TextField(
                      expands: false,
                      decoration: InputDecoration(
                          labelText: TTexts.firstName,
                          prefixIcon: Icon(Iconsax.user)),
                    ),
                  ),
                  SizedBox(
                    width: TSizes.spaceBtwInputFields,
                  ),

                  /// LN
                  Expanded(
                    child: TextField(
                      expands: false,
                      decoration: InputDecoration(
                          labelText: TTexts.lastName,
                          prefixIcon: Icon(Iconsax.user)),
                    ),
                  ),
                ],
              ),

              /// Register form
              const RegisterForm(),

              /// Terms and condition
              TermsNdConditions(dark: dark),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Sign up button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.to(const VerifyEmail()),
                      child: const Text(TTexts.submit))),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// Divider
              LoginDivider(
                dark: dark,
                dividerString: TTexts.orSignUpWith,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Footer
              const SocialIcons(),
            ],
          ),
        ),
      ),
    );
  }
}
