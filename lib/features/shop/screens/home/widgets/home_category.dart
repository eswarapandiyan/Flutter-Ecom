import 'package:flutter/cupertino.dart';
import 'package:my_store/common/widgets/image_text_widget/vertical_image_text.dart';
import 'package:my_store/utils/constants/image_strings.dart';

class CustomeHomeCategories extends StatelessWidget {
  const CustomeHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return CustomeVerticalImages(
              title: 'Shoes Category',
              image: TImages.shoeIcon,
              onTap: () {},
            );
          }),
    );
  }
}
