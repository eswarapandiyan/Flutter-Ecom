import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_store/common/widgets/loaders/loaders.dart';
import 'package:my_store/data/repositories/authentication/authentication_repository.dart';
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
          title: "Fire Store Exception--save data", message: e.toString());
    }
  }

  /// Function to fetch the data from the fire store
  Future<UserModel?> fetchUserData() async {
    try {
      final documentSnapshot = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();

      if (documentSnapshot.exists) {
        return UserModel?.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } catch (e) {
      print(e.toString());
      CustomLoaders.errorSnackBar(
          title: "Fire Store Exception--Fetch data", message: e.toString());
    }
    return null;
  }

  /// Function to update the user data in Fire store
  Future<void> updateUserDetails(UserModel updateUser) async {
    try {
      await _db
          .collection("Users")
          .doc(updateUser.id)
          .update(updateUser.toJson());
    } catch (e) {
      CustomLoaders.errorSnackBar(
          title: "Fire Store Exception--update user details",
          message: e.toString());
    }
  }

  /// Function to save the user data in Fire store
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser!.uid)
          .update(json);
    } catch (e) {
      CustomLoaders.errorSnackBar(
          title: "Fire Store Exception--update Single Field ",
          message: e.toString());
    }
  }

  /// Function to save the user data in Fire store
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    } catch (e) {
      CustomLoaders.errorSnackBar(
          title: "Fire Store Exception--remove User Record",
          message: e.toString());
    }
  }

  /// upload any image
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseAuthException catch (e) {
      throw CustomLoaders.errorSnackBar(
          title: 'FireStorage Exception! --- UPLOADE IMAGE',
          message: e.toString());
    } catch (e) {
      throw CustomLoaders.errorSnackBar(
          title: 'Unknown Error!', message: e.toString());
    }
  }
}
