import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/constants/text_strings.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),

        /// Username
        TextField(
          decoration: InputDecoration(
              labelText: TTexts.username, prefixIcon: Icon(Iconsax.user)),
        ),
        SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),

        /// email
        TextField(
          decoration: InputDecoration(
              labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct_right)),
        ),
        SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),

        /// mobile
        TextField(
          decoration: InputDecoration(
              labelText: TTexts.phoneNo, prefixIcon: Icon(Iconsax.mobile)),
        ),
        SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),

        /// Password
        TextField(
          decoration: InputDecoration(
              labelText: TTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash)),
        ),
        SizedBox(
          height: TSizes.spaceBtwSections,
        ),
      ],
    );
  }
}
