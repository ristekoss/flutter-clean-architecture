import 'package:flutter/material.dart';

import '../../../../design/constants/colors.dart';
import '../../../../design/constants/text_style.dart';

class OnboardingBody extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const OnboardingBody(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 100,
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          title,
          style: AppTextStyle.headline1.copyWith(color: AppColors.secondary),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          subtitle,
          style: AppTextStyle.regularSemiBold.copyWith(color: Colors.black54),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
