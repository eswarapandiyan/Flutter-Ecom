import 'package:get/get.dart';
import 'package:my_store/common/widgets/loaders/loaders.dart';
import 'package:my_store/data/repositories/categories/category_repositary.dart';
import 'package:my_store/features/shop/model/category/category_model.dart';
import 'package:my_store/utils/popups/full_screen_loader.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final _categoryRepositary = Get.put(CategoryRepositary());
  final isLoading = false.obs;
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      /// Start Loading
      isLoading.value = true;

      /// Fetching all category
      final categories = await _categoryRepositary.getAllCategory();

      /// update all category
      allCategories.assignAll(categories);

      /// Filter the Featured Category
      featuredCategories.assignAll(categories
          .where(
              (category) => category.isFeatured && category.parentId.isNotEmpty)
          .take(8)
          .toList());
    } catch (e) {
      TScreenLoader.stopLoading();
      CustomLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
