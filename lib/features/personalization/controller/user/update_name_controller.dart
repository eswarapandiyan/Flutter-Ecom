import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/common/widgets/loaders/loaders.dart';
import 'package:my_store/data/repositories/user/user_repository.dart';
import 'package:my_store/features/personalization/controller/user/user_controller.dart';
import 'package:my_store/features/personalization/screens/profile/profile.dart';
import 'package:my_store/utils/helpers/network_manager.dart';
import 'package:my_store/utils/popups/full_screen_loader.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepositary = Get.put(UserRepository());
  GlobalKey<FormState> updateNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initializeName();
  }

  Future<void> initializeName() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateName() async {
    try {
      TScreenLoader.openLoadingDialog('Updating your changes...',
          'assets/images/animations/141594-animation-of-docer.json');
      final isConnected = await NetworkManager.instance.isConnected();

      /// Check Internet connectivity
      if (!isConnected) {
        TScreenLoader.stopLoading();
        return;
      }

      if (!updateNameFormKey.currentState!.validate()) {
        TScreenLoader.stopLoading();
        return;
      }

      /// update user FN and LN
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };

      await userRepositary.updateSingleField(name);

      /// update the RX user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      /// Stop loading
      TScreenLoader.stopLoading();

      CustomLoaders.successSnackBar(
          title: 'Congragulations!', message: 'Your name has been updated');
      Get.off(() => const ProfileScreen());
    } catch (e) {
      CustomLoaders.errorSnackBar(
          title: 'Data not saved!', message: 'The data is not updated');
    }
  }
}
