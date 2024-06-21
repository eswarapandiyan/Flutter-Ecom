import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_store/common/widgets/loaders/loaders.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/helpers/network_manager.dart';
import 'package:my_store/utils/popups/full_screen_loader.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();

  /// variable initialization
  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phone = TextEditingController();
  final userName = TextEditingController();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  /// Register
  Future<void> register() async {
    try {
      TScreenLoader.openLoadingDialog(
          'We are processing your information', TImages.productsIllustration);
      final isConnected = await NetworkManager.instance.isConnected();

      /// Check Internet connectivity
      if (!isConnected) {
        // TScreenLoader.stopLoading();
        return;
      }

      /// Form validation
      if (!registerFormKey.currentState!.validate()) {
        // TScreenLoader.stopLoading();
        return;
      }
    } catch (e) {
      CustomLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      TScreenLoader.stopLoading();
    }
  }
}
