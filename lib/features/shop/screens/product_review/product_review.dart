import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_store/common/widgets/appBar/appBar.dart';
import 'package:my_store/common/widgets/products/rating/rating.dart';
import 'package:my_store/features/shop/screens/product_review/widgets/overall_rating.dart';
import 'package:my_store/features/shop/screens/product_review/widgets/user_review_card.dart';
import 'package:my_store/utils/constants/sizes.dart';

class PeoductReview extends StatelessWidget {
  const PeoductReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(
        title: Text(
          'Reviews & Ratings',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Ratings and Reviews are verified and are from people who use the same type of devices that you see'),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Overall product Ratings
              const OverallProductRating(),
              const CustomRatingBarIndicator(),
              Text('12,611', style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
