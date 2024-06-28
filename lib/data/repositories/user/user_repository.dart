import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:my_store/common/widgets/loaders/loaders.dart';
import 'package:my_store/features/authentication/models/user_register_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  /// Create the instance of Firebase FireStore
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save the user data in Fire store
  Future<void> saveUserData(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } catch (e) {
      CustomLoaders.errorSnackBar(
          title: "Fire Store Exception", message: e.toString());
    }
  }
}
