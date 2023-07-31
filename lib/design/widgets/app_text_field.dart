import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/text_style.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  const AppTextField({Key? key, required this.controller, required this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          controller: controller,
          style: AppTextStyle.regularSemiBold.copyWith(color: Colors.black),
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: AppTextStyle.regularSemiBold.copyWith(color: AppColors.grey200)
          ),
        ));
  }
}
