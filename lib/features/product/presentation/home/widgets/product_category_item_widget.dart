import 'package:flutter/material.dart';

import '../../../../../design/constants/colors.dart';
import '../../../../../design/constants/text_style.dart';

class ProductCategoryItemWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  const ProductCategoryItemWidget({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        right: 16,
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: AppColors.primary,
            size: 36,
          ),
          Text(
            text,
            style: AppTextStyle.regularSemiBold.copyWith(
              color: AppColors.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
