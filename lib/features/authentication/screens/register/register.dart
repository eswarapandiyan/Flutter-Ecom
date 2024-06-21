import 'package:flutter/material.dart';
import 'package:my_store/common/widgets/login_page/divider.dart';
import 'package:my_store/common/widgets/login_page/social_icons.dart';
import 'package:my_store/features/authentication/screens/register/widgets/register_form.dart';
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

              /// Register form
              const RegisterForm(),

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
