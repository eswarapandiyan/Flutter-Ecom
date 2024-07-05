import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:my_store/common/widgets/loaders/loaders.dart';
import 'package:my_store/data/services/firebase_storage/firebase_storage_service.dart';
import 'package:my_store/features/shop/model/category/category_model.dart';

class CategoryRepositary extends GetxController {
  static CategoryRepositary get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get All category from fire store
  Future<List<CategoryModel>> getAllCategory() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      return CustomLoaders.errorSnackBar(
          title: 'FireStore Exception! --- GetCategories',
          message: e.toString());
    } catch (e) {
      return CustomLoaders.errorSnackBar(
          title: 'Unknown Error!', message: e.toString());
    }
  }

  /// Upload dummy data into the fireStore from local
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      final storage = Get.put(FireBaseStorageService());

      for (var category in categories) {
        /// Get image data link from the local asset
        final file = await storage.getImagedataFromAssets(category.image);

        /// Upload Image and Get the url
        final url =
            await storage.uploadImageData('Categories', file, category.name);

        /// Assign Url to the category image attribute
        category.image = url;

        await _db
            .collection("Categories")
            .doc(category.id)
            .set(category.toJson());
      }
    } on FirebaseException catch (e) {
      return CustomLoaders.errorSnackBar(
          title: 'FireStore Exception! --- uploadDummyData',
          message: e.toString());
    } catch (e) {
      return CustomLoaders.errorSnackBar(
          title: 'Unknown Error!', message: e.toString());
    }
  }
}
