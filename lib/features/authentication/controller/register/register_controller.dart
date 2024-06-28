import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_store/common/widgets/loaders/loaders.dart';
import 'package:my_store/data/repositories/authentication/authentication_repository.dart';
import 'package:my_store/data/repositories/user/user_repository.dart';
import 'package:my_store/features/authentication/models/user_register_model.dart';
import 'package:my_store/features/authentication/screens/register/verify_email.dart';
import 'package:my_store/utils/helpers/network_manager.dart';
import 'package:my_store/utils/popups/full_screen_loader.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();

  /// variable initialization
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phone = TextEditingController();
  final userName = TextEditingController();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  /// Register
  void register() async {
    try {
      TScreenLoader.openLoadingDialog('We are processing your information',
          'assets/images/animations/141594-animation-of-docer.json');
      final isConnected = await NetworkManager.instance.isConnected();

      /// Check Internet connectivity
      if (!isConnected) {
        TScreenLoader.stopLoading();
        return;
      }

      /// Form validation
      if (!registerFormKey.currentState!.validate()) {
        TScreenLoader.stopLoading();
        return;
      }

      /// Privacy policy validation
      if (!privacyPolicy.value) {
        CustomLoaders.warningSnackBar(
            title: 'Accept The Privacy Policy',
            message:
                'In order to create account,you must have to read the privacy policy and Terms of use');
        return;
      }

      /// Registering the user credential in fire base Authentication
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());
      if (userCredential != null) {
        final newUser = UserModel(
            id: userCredential.user!.uid,
            userName: userName.text.trim(),
            email: email.text.trim(),
            firstName: firstName.text.trim(),
            lastName: lastName.text.trim(),
            phoneNumber: phone.text.trim(),
            profilePicture: '');

        /// creating the instance of user repository
        final userRepository = Get.put(UserRepository());
        await userRepository.saveUserData(newUser);

        /// Stop Loading
        TScreenLoader.stopLoading();

        /// show the Success message
        CustomLoaders.successSnackBar(
            title: 'Congragulations',
            message: 'Your account has been created,verify email to continue');

        /// Move to verify email Screen
        Get.to(() => VerifyEmail(
              email: email.text.trim(),
            ));
      } else {
        print('Registeration failed Please Try again');
      }
    } catch (e) {
      CustomLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
