import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:my_store/common/widgets/loaders/loaders.dart';
import 'package:my_store/common/widgets/success_screen/success_screen.dart';
import 'package:my_store/data/repositories/authentication/authentication_repository.dart';
import 'package:my_store/utils/constants/text_strings.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Sent email verifficaton link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      CustomLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Please check your Inbox and verify your email');
    } catch (e) {
      CustomLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// TImer to auto redirect to the Email verifcation
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        print('success Screen time');
        Get.off(() => SuccessScreen(
            image: 'assets/images/animations/72462-check-register.json',
            title: TTexts.yourAccountCreatedTitle,
            subtitle: TTexts.yourAccountCreatedSubTitle,
            onPressed: () =>
                AuthenticationRepository.instance.screenRedirect()));
      }
    });
  }

  /// Mannualy check if email verified
  checkEmailVerificationStatus() {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null && currentUser.emailVerified) {
      print('success screen email verification');
      Get.off(() => SuccessScreen(
          image: 'assets/images/animations/72462-check-register.json',
          title: TTexts.yourAccountCreatedTitle,
          subtitle: TTexts.yourAccountCreatedSubTitle,
          onPressed: AuthenticationRepository.instance.screenRedirect()));
    }
  }
}
