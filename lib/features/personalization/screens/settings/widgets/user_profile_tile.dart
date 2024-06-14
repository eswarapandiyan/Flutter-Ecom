import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/common/widgets/images/custome_image_banner.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/image_strings.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
    required this.titleName,
    required this.email,
    required this.onPressed,
  });
  final String titleName, email;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CustomeBannerImages(
        imageUrl: TImages.user,
        width: 50,
        height: 50,
        borderRadius: 100,
      ),
      title: Text(titleName,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: TColors.white)),
      subtitle: Text(email,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .apply(color: TColors.white)),
      trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Iconsax.edit,
            color: TColors.white,
          )),
    );
  }
}
