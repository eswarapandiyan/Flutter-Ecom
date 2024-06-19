import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/common/widgets/appBar/appBar.dart';
import 'package:my_store/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:my_store/common/widgets/list_tile/list_tile.dart';
import 'package:my_store/common/widgets/texts/custome_section_heading.dart';
import 'package:my_store/features/personalization/screens/address/address.dart';
import 'package:my_store/features/personalization/screens/profile/profile.dart';
import 'package:my_store/features/personalization/screens/settings/widgets/user_profile_tile.dart';
import 'package:my_store/features/shop/screens/orders/orders.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  /// App bar
                  CustomeAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: TColors.white),
                    ),
                  ),

                  /// user profile card
                  UserProfileTile(
                    titleName: 'Coding with Eswar',
                    email: 'eswar@gmail.com',
                    onPressed: () => Get.to(const ProfileScreen()),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections / 2,
                  ),
                ],
              ),
            ),

            /// body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const CustomeSectionHeading(
                    title: 'Account Settings',
                    showActionBtn: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  /// Account setting List Tiles
                  SettingListTile(
                      title: 'My Address',
                      subtitle: 'Set Shopping delivery address',
                      icon: Iconsax.safe_home,
                      onTap: () => Get.to(const AddressScreen())),
                  SettingListTile(
                      title: 'My Cart',
                      subtitle: 'Add,remove products and move to checkout',
                      icon: Iconsax.shopping_cart,
                      onTap: () {}),
                  SettingListTile(
                      title: 'My Order',
                      subtitle: 'in-progress and completed orders',
                      icon: Iconsax.bag_tick,
                      onTap: () => Get.to(const OrderScreen())),
                  SettingListTile(
                      title: 'Bank Account',
                      subtitle: 'Withdraw balance to register the Bank Account',
                      icon: Iconsax.bank,
                      onTap: () {}),
                  SettingListTile(
                      title: 'My Coupons',
                      subtitle: 'List of all the discounted coupouns',
                      icon: Iconsax.discount_shape,
                      onTap: () {}),
                  SettingListTile(
                      title: 'Notification',
                      subtitle: 'Set any time of notification message',
                      icon: Iconsax.notification,
                      onTap: () {}),
                  SettingListTile(
                      title: 'Account Privacy',
                      subtitle: 'Mannage data usage and connected accounts',
                      icon: Iconsax.security_card,
                      onTap: () {}),

                  ///App setting List tiles
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const CustomeSectionHeading(
                    title: 'App Settings',
                    showActionBtn: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  SettingListTile(
                      title: 'Load data',
                      subtitle: 'Upload data to your cloud Fire base',
                      icon: Iconsax.document_upload,
                      onTap: () {}),
                  SettingListTile(
                    title: 'Geolocation',
                    subtitle: 'Set recommendation based on your location',
                    icon: Iconsax.location,
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  SettingListTile(
                      title: 'Safe Mode',
                      subtitle: 'Search result is safe for all ages',
                      icon: Iconsax.security_user,
                      trailing: Switch(value: false, onChanged: (value) {})),
                  SettingListTile(
                      title: 'HD image quality',
                      subtitle: 'Set image qulaity to be seen ',
                      icon: Iconsax.image,
                      trailing: Switch(value: false, onChanged: (value) {})),

                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          'Log out',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      )),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
