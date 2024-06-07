import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_store/features/authentication/screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  int currentPageIndex = 0;

  /// Update current index when page scroll
  void updatePageIndicator(index) => currentPageIndex = index;

  /// Jump to specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex = index;
    pageController.jumpToPage(index);
  }

  /// Update current index and jump to next page
  void nextPage() {
    if (currentPageIndex == 2) {
      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex + 1;
      pageController.jumpToPage(page);
    }
  }

  /// Update current index and jump to lat page
  void skipPage() {
    currentPageIndex = 2;
    pageController.jumpToPage(2);
  }
}
