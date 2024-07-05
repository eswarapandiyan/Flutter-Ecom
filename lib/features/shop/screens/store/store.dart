import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/common/widgets/appBar/appBar.dart';
import 'package:my_store/common/widgets/appBar/tabBar.dart';
import 'package:my_store/common/widgets/brands/custom_brand_grid.dart';
import 'package:my_store/common/widgets/custom_shapes/container/search_container.dart';
import 'package:my_store/common/widgets/layout/grid_layout.dart';
import 'package:my_store/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:my_store/common/widgets/texts/custome_section_heading.dart';
import 'package:my_store/features/shop/controller/category_controller.dart';
import 'package:my_store/features/shop/screens/brands/all_brands.dart';
import 'package:my_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: CustomeAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            CartCounterIcon(
                onPressed: () {},
                color: THelperFunctions.isDarkMode(context)
                    ? TColors.white
                    : TColors.black)
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                    pinned: true,
                    floating: true,
                    backgroundColor: THelperFunctions.isDarkMode(context)
                        ? TColors.black
                        : TColors.white,
                    expandedHeight: 440,
                    automaticallyImplyLeading: false,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.all(TSizes.defaultSpace),
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          /// Search bar
                          const SizedBox(
                            height: TSizes.spaceBtwItems,
                          ),
                          SearchBarContainer(
                            text: 'Search in store',
                            showBorder: true,
                            showBackground: false,
                            padding: EdgeInsets.zero,
                          ),
                          const SizedBox(
                            height: TSizes.spaceBtwItems,
                          ),

                          ///Feature brands
                          CustomeSectionHeading(
                            title: 'Featured brands',
                            onPressed: () {},
                          ),
                          const SizedBox(
                            height: TSizes.spaceBtwItems / 1.5,
                          ),

                          /// Brand Grid
                          CustomGridLayout(
                              itemCount: 4,
                              mainAxisExtent: 80,
                              itemBuilder: (_, index) {
                                return CustomBrandGrid(
                                  showBorder: true,
                                  onTap: () => Get.to(() => const AllBrands()),
                                );
                              })
                        ],
                      ),
                    ),
                    bottom: CustomeTabBar(
                        tabs: categories
                            .map((category) => Tab(
                                  child: Text(category.name),
                                ))
                            .toList())),
              ];
            },
            body: TabBarView(
              children: categories
                  .map((category) => CategoryTab(category: category))
                  .toList(),
            )),
      ),
    );
  }
}
