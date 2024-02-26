import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/text_style.dart';

class AppTextButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const AppTextButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        label,
        style: AppTextStyle.regularSemiBold.copyWith(
          color: AppColors.primary,
        ),
      ),
    );
  }
}
