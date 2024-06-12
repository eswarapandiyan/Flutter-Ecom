import 'package:flutter/material.dart';
import 'package:my_store/common/widgets/appBar/appBar.dart';
import 'package:my_store/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:my_store/features/personalization/screens/settings/widgets/user_profile_tile.dart';
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
                  const UserProfileTile(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),

            /// body
            // Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
            // child: Column(
            //   children: [
            //     Text('Account details')
            //   ],
            // ),)
          ],
        ),
      ),
    );
  }
}
