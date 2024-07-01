import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_store/common/widgets/loaders/loaders.dart';
import 'package:my_store/data/repositories/authentication/authentication_repository.dart';
import 'package:my_store/features/personalization/controller/user/user_controller.dart';
import 'package:my_store/utils/helpers/network_manager.dart';
import 'package:my_store/utils/popups/full_screen_loader.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final localStorage = GetStorage();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    super.onInit();
    // Check if 'REMEMBER_ME_EMAIL' and 'REMEMBER_ME_PASSWORD' keys exist before reading
    if (localStorage.hasData('REMEMBER_ME_EMAIL')) {
      email.text = localStorage.read('REMEMBER_ME_EMAIL');
    }
    if (localStorage.hasData('REMEMBER_ME_PASSWORD')) {
      password.text = localStorage.read('REMEMBER_ME_PASSWORD');
    }
  }

  void login() async {
    try {
      TScreenLoader.openLoadingDialog('You are Logging in ....',
          'assets/images/animations/141594-animation-of-docer.json');
      final isConnected = await NetworkManager.instance.isConnected();

      /// Check Internet connectivity
      if (!isConnected) {
        TScreenLoader.stopLoading();
        return;
      }

      /// Form validation
      if (!loginFormKey.currentState!.validate()) {
        TScreenLoader.stopLoading();
        return;
      }

      /// Save data if remember me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      /// Login user using email and Password Authentication
      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      /// Remove Loader
      TScreenLoader.stopLoading();

      /// Redirection Screen
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TScreenLoader.stopLoading();
      CustomLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }

  /// Sign in with Google
  Future<void> googleSignIn() async {
    try {
      TScreenLoader.openLoadingDialog('You are Logging in ....',
          'assets/images/animations/141594-animation-of-docer.json');
      final isConnected = await NetworkManager.instance.isConnected();

      /// Check Internet connectivity
      if (!isConnected) {
        TScreenLoader.stopLoading();
        return;
      }

      /// Google Authentication
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      /// save user Record
      await userController.saveUserRecord(userCredentials);

      /// Stop Loading
      TScreenLoader.stopLoading();

      /// Redirect
      await AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TScreenLoader.stopLoading();
      CustomLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }

  /// Sign in with Facebook
  Future<void> facebookSignIn() async {
    try {
      TScreenLoader.openLoadingDialog('You are Logging in ....',
          'assets/images/animations/141594-animation-of-docer.json');
      final isConnected = await NetworkManager.instance.isConnected();

      // Check Internet connectivity
      if (!isConnected) {
        TScreenLoader.stopLoading();
        return;
      }

      // Facebook Authentication
      final userCredentials =
          await AuthenticationRepository.instance.signInWithFacebook();

      // Save user record
      await userController.saveUserRecord(userCredentials);

      // Stop Loading
      TScreenLoader.stopLoading();

      // Redirect
      await AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TScreenLoader.stopLoading();
      CustomLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }
}
