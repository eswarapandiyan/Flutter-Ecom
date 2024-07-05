import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FireBaseStorageService extends GetxController {
  static FireBaseStorageService get instance => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;

  /// Upload local assets from the IDE
  /// returns the Uint8List image data
  Future<Uint8List> getImagedataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.offsetInBytes);
      return imageData;
    } catch (e) {
      throw 'Error Loading Image data! : $e';
    }
  }

  /// upload image using image dataon Cloud firestore Storage
  /// Returns the downloaded URL of the uploaded image
  Future<String> uploadImageData(
      String path, Uint8List image, String name) async {
    try {
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      throw 'Error Loading Image data!--upload image data : $e';
    }
  }

  /// Upload Image file into the fire store
  /// Returns the downloaded URL of the uploaded image
  Future<String> uploadImageFile(String path, XFile image) async {
    try {
      final ref = _firebaseStorage.ref(path).child(image.name);
      await ref.putFile(image.path as File);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      throw 'Error Loading Image data!--upload image data : $e';
    }
  }
}
