import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/common/widgets/appBar/appBar.dart';
import 'package:my_store/common/widgets/images/custome_rounded_image.dart';
import 'package:my_store/common/widgets/texts/custome_section_heading.dart';
import 'package:my_store/features/personalization/controller/user/user_controller.dart';
import 'package:my_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:my_store/features/personalization/screens/profile/widgets/update_FN_LN.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: CustomeAppBar(
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const CustomRoundedImage(
                    image: TImages.user,
                    height: 80,
                    width: 80,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text('Change Profile Picture'))
                ],
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections / 2,
            ),
            const Divider(),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            /// heading1
            const CustomeSectionHeading(
              title: 'Profile Information',
              showActionBtn: false,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Obx(
              () => ProfileMenu(
                title: 'Name',
                value: controller.user.value.fullName,
                onPressed: () => Get.to(const UpdateFirstNameLastName()),
              ),
            ),
            ProfileMenu(
              title: 'Username',
              value: controller.user.value.userName,
              onPressed: () {},
            ),

            const SizedBox(
              height: TSizes.spaceBtwSections / 2,
            ),
            const Divider(),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            /// heading1
            const CustomeSectionHeading(
              title: 'Personal Information',
              showActionBtn: false,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            ProfileMenu(
              title: 'User_ID',
              value: '3345',
              onPressed: () {},
              icon: Iconsax.copy,
            ),
            ProfileMenu(
              title: 'Email',
              value: 'eswar@gmail.com',
              onPressed: () {},
            ),
            ProfileMenu(
              title: 'Phone No',
              value: '+91-9876543210',
              onPressed: () {},
            ),
            ProfileMenu(
              title: 'Gender',
              value: 'Male',
              onPressed: () {},
            ),
            ProfileMenu(
              title: 'Date of Birth',
              value: '24 Jan, 2002',
              onPressed: () {},
            ),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems / 1.5),
            Expanded(
              child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopUp(),
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
