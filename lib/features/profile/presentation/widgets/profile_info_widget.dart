import 'package:flutter/material.dart';

import '../../../../design/constants/colors.dart';
import '../../../../design/constants/text_style.dart';

class ProfileInfoWidget extends StatelessWidget {
  final String label;
  final String content;

  const ProfileInfoWidget({
    super.key,
    required this.label,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyle.appBar.copyWith(
            color: AppColors.secondary,
          ),
        ),
        Text(
          content,
          style: AppTextStyle.regularSemiBold.copyWith(
            color: AppColors.secondary,
          ),
        ),
      ],
    );
  }
}
