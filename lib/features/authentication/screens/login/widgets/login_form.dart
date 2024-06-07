import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/features/authentication/screens/password_config/forget_pass.dart';
import 'package:my_store/features/authentication/screens/register/register.dart';
import 'package:my_store/navigation_menu.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/constants/text_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        /// email
        TextFormField(
          decoration: const InputDecoration(
              labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct_right)),
        ),
        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),

        /// password
        TextFormField(
          decoration: const InputDecoration(
              labelText: TTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash)),
        ),
        const SizedBox(
          height: TSizes.spaceBtwInputFields / 2,
        ),

        /// Remember me and Forget password
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Remember me
            Row(
              children: [
                Checkbox(value: true, onChanged: (value) {}),
                const Text(TTexts.rememberMe),
              ],
            ),

            /// Forget password
            TextButton(
                onPressed: () => Get.to(const ForgetPassword()),
                child: const Text(TTexts.forgetPassword))
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),

        /// Sign in Button
        SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => Get.to(BottomNavigationMenu()),
                child: const Text(TTexts.signIn))),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        /// Create account button
        SizedBox(
            width: double.infinity,
            child: OutlinedButton(
                onPressed: () => Get.to(Register()),
                child: const Text(TTexts.createAccount))),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
      ],
    ));
  }
}
