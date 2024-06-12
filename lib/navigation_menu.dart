import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/features/personalization/screens/settings/settings.dart';
import 'package:my_store/features/shop/screens/home/home.dart';
import 'package:my_store/features/shop/screens/store/store.dart';
import 'package:my_store/features/shop/screens/whishlist/whishlist.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class BottomNavigationMenu extends StatelessWidget {
  const BottomNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkMode ? TColors.black : TColors.white,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Shop'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    Container(
      child: const HomeScreen(),
    ),
    Container(
      child: const StoreScreen(),
    ),
    Container(
      child: const WishListScreen(),
    ),
    Container(
      child: const SettingsScreen(),
    ),
  ];
}
