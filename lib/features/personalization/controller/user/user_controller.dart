import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_store/common/widgets/loaders/loaders.dart';
import 'package:my_store/data/repositories/authentication/authentication_repository.dart';
import 'package:my_store/data/repositories/user/user_repository.dart';
import 'package:my_store/features/authentication/models/user_register_model.dart';
import 'package:my_store/features/authentication/screens/login/login.dart';
import 'package:my_store/features/personalization/screens/profile/widgets/reauth_user_login_form.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/network_manager.dart';
import 'package:my_store/utils/popups/full_screen_loader.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final hidePassword = false.obs;
  final imageUploading = false.obs;
  GlobalKey<FormState> reAuthUserFormKey = GlobalKey<FormState>();

  Rx<UserModel> user = UserModel.empty().obs;
  final profileLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchUserRecord();
  }

  /// fetch user data of logged user
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserData();
      this.user(user);
      profileLoading.value = false;
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// function to save user record
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      await fetchUserRecord();

      if (user.value.id.isNotEmpty) {
        if (userCredential != null) {
          final nameParts =
              UserModel.nameParts(userCredential.user!.displayName ?? '');
          final username = UserModel.generateUserName(
              userCredential.user!.displayName ?? '');

          /// Map the data
          final user = UserModel(
              id: userCredential.user!.uid,
              userName: username,
              email: userCredential.user!.email ?? '',
              firstName: nameParts[0],
              lastName:
                  nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
              phoneNumber: userCredential.user!.phoneNumber ?? '',
              profilePicture: userCredential.user!.photoURL ?? '');

          /// Save user data
          await userRepository.saveUserData(user);
        }
      }
    } catch (e) {
      CustomLoaders.errorSnackBar(
          title: 'Data not saved!',
          message:
              'Something went wrong while saving your infomation,you can re-save your data in your profile');
    }
  }

  /// Delete account warning
  void deleteAccountWarningPopUp() async {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(TSizes.md),
        title: 'Delete Account',
        middleText:
            'Are you sure want to delete your account permanantly? this action will not reversable,and all your data will be removed permanantly',
        confirm: ElevatedButton(
            onPressed: () async => deleteUserAccount(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              side: const BorderSide(color: Colors.red),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
              child: Text('delete'),
            )),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text('Cancel')));
  }

  void deleteUserAccount() async {
    try {
      TScreenLoader.openLoadingDialog('Processing...',
          'assets/images/animations/141594-animation-of-docer.json');

      /// First reauthenticate user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          Get.offAll(const LoginScreen());
        } else if (provider == 'password') {
          TScreenLoader.stopLoading();
          Get.to(const ReAuthUserLoginForm());
        }
      }
    } catch (e) {
      TScreenLoader.stopLoading();
      CustomLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }

  /// ReAuthenticate before deleting
  void reAuthEmailAndPasswordUser() async {
    try {
      TScreenLoader.openLoadingDialog('Processing...',
          'assets/images/animations/141594-animation-of-docer.json');
      final isConnected = await NetworkManager.instance.isConnected();

      /// Check Internet connectivity
      if (!isConnected) {
        TScreenLoader.stopLoading();
        return;
      }

      if (!reAuthUserFormKey.currentState!.validate()) {
        TScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthWithEmailandPassword(
          verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();

      TScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TScreenLoader.stopLoading();

      CustomLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  void uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        // Upload Image
        imageUploading.value = true;
        final imageUrl =
            await userRepository.uploadImage('Users/Images/Profile', image);
        // Update User Image record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();

        CustomLoaders.successSnackBar(
            title: 'Congragulations',
            message: 'Your profile picture updated successfully');
      }
    } catch (e) {
      print(e.toString());
      CustomLoaders.errorSnackBar(
          title: 'Oh Snap - upload exception!', message: e.toString());
    } finally {
      imageUploading.value = false;
    }
  }
}
