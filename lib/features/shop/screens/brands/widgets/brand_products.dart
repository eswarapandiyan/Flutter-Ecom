import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_store/common/widgets/appBar/appBar.dart';
import 'package:my_store/common/widgets/brands/custom_brand_grid.dart';
import 'package:my_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:my_store/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(
        title: Text(
          'Nike',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Bar
              CustomBrandGrid(showBorder: true, onTap: () {}),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              CustomSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
