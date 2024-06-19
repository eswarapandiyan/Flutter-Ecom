import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/common/widgets/appBar/appBar.dart';
import 'package:my_store/features/personalization/screens/address/add_new_address.dart';
import 'package:my_store/features/personalization/screens/address/widgets/single_address.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(const AddNewAdress()),
        child: Icon(Iconsax.add, color: TColors.white),
        backgroundColor: TColors.primary,
      ),
      appBar: CustomeAppBar(
        title: Text(
          'Address',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SingleAddress(selectedAdress: false),
              SingleAddress(selectedAdress: true),
            ],
          ),
        ),
      ),
    );
  }
}
