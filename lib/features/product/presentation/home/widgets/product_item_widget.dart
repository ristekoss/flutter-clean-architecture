import 'package:boilerplate/core/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../design/constants/colors.dart';
import '../../../../../design/constants/text_style.dart';

class ProductItemWidget extends StatelessWidget {
  final String title;
  final String price;
  final String category;
  final String image;

  const ProductItemWidget({
    super.key,
    required this.title,
    required this.price,
    required this.category,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (image.isEmpty)
          Image.asset(
            Assets.imgBackground,
            height: 120,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        if(image.isNotEmpty)
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              image,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 2,
                style:
                    AppTextStyle.headline3.copyWith(color: AppColors.primary),
              ),
              const SizedBox(
                height: 2,
              ),
              Text('\$ $price'),
              const SizedBox(
                height: 2,
              ),
              Text(
                category,
                style: AppTextStyle.regularSemiBold
                    .copyWith(color: AppColors.secondary),
              ),
            ],
          ),
        )
      ],
    );
  }
}
