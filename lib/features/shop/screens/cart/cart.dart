import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_store/common/widgets/appBar/appBar.dart';
import 'package:my_store/features/shop/screens/cart/widgets/cart_item_list.dart';
import 'package:my_store/features/shop/screens/checkout/checkout.dart';
import 'package:my_store/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(
        title: Text(
          'Cart Items',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),

        /// Cart Item List
        child: CartItemsList(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace / 2),
        child: ElevatedButton(
            onPressed: () => Get.to(const CheckoutScreen()),
            child: const Text('Checkout \$259')),
      ),
    );
  }
}
