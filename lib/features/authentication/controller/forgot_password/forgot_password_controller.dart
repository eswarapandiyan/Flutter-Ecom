import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/common/widgets/loaders/loaders.dart';
import 'package:my_store/data/repositories/authentication/authentication_repository.dart';
import 'package:my_store/features/authentication/screens/password_config/reset_pass.dart';
import 'package:my_store/utils/helpers/network_manager.dart';
import 'package:my_store/utils/popups/full_screen_loader.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgotPasswordKey = GlobalKey<FormState>();

  /// Sent reset password email
  sendResetPasswordEmail() async {
    try {
      TScreenLoader.openLoadingDialog('Proccessing your request...',
          'assets/images/animations/141594-animation-of-docer.json');
      final isConnected = await NetworkManager.instance.isConnected();

      /// Check Internet connectivity
      if (!isConnected) {
        TScreenLoader.stopLoading();
        return;
      }

      /// Form validation
      if (!forgotPasswordKey.currentState!.validate()) {
        TScreenLoader.stopLoading();
        return;
      }

      /// Send email to reset password
      await AuthenticationRepository.instance
          .sendEmailResetPassword(email.text.trim());

      /// Stop loading
      TScreenLoader.stopLoading();

      /// Show success snack bar
      CustomLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email link is sent to Reset your Password'.tr);

      /// Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      TScreenLoader.stopLoading();
      CustomLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      TScreenLoader.openLoadingDialog('Proccessing your request...',
          'assets/images/animations/141594-animation-of-docer.json');
      final isConnected = await NetworkManager.instance.isConnected();

      /// Check Internet connectivity
      if (!isConnected) {
        TScreenLoader.stopLoading();
        return;
      }

      /// Form validation
      if (!forgotPasswordKey.currentState!.validate()) {
        TScreenLoader.stopLoading();
        return;
      }

      /// Send email to reset password
      await AuthenticationRepository.instance.sendEmailResetPassword(email);

      /// Stop loading
      TScreenLoader.stopLoading();

      /// Show success snack bar
      CustomLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email link is sent to Reset your Password'.tr);
    } catch (e) {
      TScreenLoader.stopLoading();
      CustomLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }
}
