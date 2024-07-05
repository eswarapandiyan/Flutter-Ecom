import 'package:my_store/features/shop/model/category/category_model.dart';
import 'package:my_store/utils/constants/image_strings.dart';

class DummyData {
  /// category model
  static final List<CategoryModel> categories = [
    CategoryModel(
        name: 'Sports', image: TImages.sportIcon, id: '1', isFeatured: true),
    CategoryModel(
        name: 'Furniture',
        image: TImages.furnitureIcon,
        id: '5',
        isFeatured: true),
    CategoryModel(
        name: 'Electronics',
        image: TImages.electronicsIcon,
        id: '2',
        isFeatured: true),
    CategoryModel(
        name: 'Cloths', image: TImages.clothIcon, id: '3', isFeatured: true),
    CategoryModel(
        name: 'Animals', image: TImages.animalIcon, id: '4', isFeatured: true),
    CategoryModel(
        name: 'Shoes', image: TImages.shoeIcon, id: '6', isFeatured: true),
    CategoryModel(
        name: 'Cosmetics',
        image: TImages.cosmeticsIcon,
        id: '7',
        isFeatured: true),
    CategoryModel(
        name: 'Jwelery',
        image: TImages.jeweleryIcon,
        id: '14',
        isFeatured: true),
  ];
}
