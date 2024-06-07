import 'package:flutter/material.dart';
import 'package:my_store/common/styles/spacing_styles.dart';
import 'package:my_store/common/widgets/login_page/divider.dart';
import 'package:my_store/common/widgets/login_page/social_icons.dart';
import 'package:my_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:my_store/features/authentication/screens/login/widgets/login_header.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/constants/text_strings.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// login starts
              LoginHeader(dark: dark),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Form Starts
              const LoginForm(),

              /// Divider
              LoginDivider(
                dark: dark,
                dividerString: TTexts.orSignInWith,
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
