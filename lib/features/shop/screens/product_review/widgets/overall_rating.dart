import 'package:flutter/material.dart';
import 'package:my_store/common/widgets/products/rating/rating.dart';
import 'package:my_store/features/shop/screens/product_review/widgets/rating_progress_indicator.dart';

class OverallProductRating extends StatelessWidget {
  const OverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            '4.5',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              /// Rating Progress Indicator
              RatingProgressIndicator(
                text: '5',
                value: 0.5,
              ),
              RatingProgressIndicator(
                text: '4',
                value: 0.3,
              ),
              RatingProgressIndicator(
                text: '3',
                value: 0.8,
              ),
              RatingProgressIndicator(
                text: '2',
                value: 0.2,
              ),
              RatingProgressIndicator(
                text: '1',
                value: 0.6,
              ),
            ],
          ),
        )
      ],
    );
  }
}
