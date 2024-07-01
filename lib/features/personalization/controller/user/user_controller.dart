import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:my_store/common/widgets/loaders/loaders.dart';
import 'package:my_store/data/repositories/user/user_repository.dart';
import 'package:my_store/features/authentication/models/user_register_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        final nameParts =
            UserModel.nameParts(userCredential.user!.displayName ?? '');
        final username =
            UserModel.generateUserName(userCredential.user!.displayName ?? '');

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
    } catch (e) {
      CustomLoaders.errorSnackBar(
          title: 'Data not saved!',
          message:
              'Something went wrong while saving your infomation,you can re-save your data in your profile');
    }
  }
}
