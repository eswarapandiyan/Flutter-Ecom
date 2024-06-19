import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/common/widgets/appBar/appBar.dart';
import 'package:my_store/common/widgets/layout/grid_layout.dart';
import 'package:my_store/common/widgets/products/product_cards/product_cards_vertical.dart';
import 'package:my_store/utils/constants/sizes.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(
        title: Text(
          'All Products',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Dropdown Bar
              DropdownButtonFormField(
                onChanged: (value) {},
                decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
                items: [
                  'Name',
                  'Higher Price',
                  'Lower Price',
                  'Sale',
                  'Newest',
                  'popularity'
                ]
                    .map((options) =>
                        DropdownMenuItem(value: options, child: Text(options)))
                    .toList(),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Grid products
              CustomGridLayout(
                  itemCount: 6,
                  itemBuilder: (_, index) => const CustomProductVertical())
            ],
          ),
        ),
      ),
    );
  }
}
