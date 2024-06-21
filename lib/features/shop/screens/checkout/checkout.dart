import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_store/common/widgets/appBar/appBar.dart';
import 'package:my_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:my_store/common/widgets/products/cart/coupon_bar.dart';
import 'package:my_store/common/widgets/success_screen/success_screen.dart';
import 'package:my_store/features/shop/screens/cart/widgets/cart_item_list.dart';
import 'package:my_store/features/shop/screens/checkout/widgets/address_section.dart';
import 'package:my_store/features/shop/screens/checkout/widgets/bill_section.dart';
import 'package:my_store/features/shop/screens/checkout/widgets/payment_section.dart';
import 'package:my_store/navigation_menu.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: CustomeAppBar(
        title: Text(
          'Checkout',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// List of Items
              const CartItemsList(
                showAddRemoveBtn: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// Coupoun bar
              const CustomCouponBar(),

              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              CustomRoundedContainer(
                showBorder: true,
                backgroundColor: dark ? TColors.dark : TColors.white,
                padding: const EdgeInsets.all(TSizes.md),
                child: const Column(
                  children: [
                    /// Billing Section
                    BillPaymentSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    Divider(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    /// Amount Payment method
                    AmountPaymentSection(),

                    // const SizedBox(
                    //   height: TSizes.spaceBtwItems / 2,
                    // ),

                    /// Address Method
                    AddressPaymentSection()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace / 2),
        child: ElevatedButton(
            onPressed: () => Get.to(SuccessScreen(
                  image: TImages.successfulPaymentIcon,
                  title: 'Payment Success',
                  subtitle: 'Your Order will be shipped soon',
                  onPressed: () => Get.offAll(const BottomNavigationMenu()),
                )),
            child: const Text('Checkout \$259')),
      ),
    );
  }
}
