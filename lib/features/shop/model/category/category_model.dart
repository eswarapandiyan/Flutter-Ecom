import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String name;
  String image;
  String id;
  String parentId;
  bool isFeatured;

  CategoryModel({
    required this.name,
    required this.image,
    required this.id,
    this.parentId = '',
    required this.isFeatured,
  });

  /// Empty Helper function
  static CategoryModel empty() => CategoryModel(
      name: '', image: '', id: '', parentId: '', isFeatured: false);

  /// Convert Model to json structure to store data in fireStore
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'IsFeatured': isFeatured,
      'Image': image,
      'ParentId': parentId,
    };
  }

  /// factory method---Map Json oriented data from the firebase to usermodel
  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return CategoryModel(
          id: document.id,
          name: data['Name'] ?? '',
          isFeatured: data['IsFeatured'] ?? false,
          image: data['Image'] ?? '',
          parentId: data['ParentId'] ?? '');
    } else {
      return CategoryModel.empty();
    }
  }
}
