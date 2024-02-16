import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/text_style.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String? label;
  final bool obscureText;

  const AppTextField({
    Key? key,
    required this.controller,
    required this.hint,
    this.label,
    this.obscureText = false,
  }) : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late ValueNotifier<bool> isObscure;

  @override
  void initState() {
    isObscure = ValueNotifier<bool>(widget.obscureText);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(
            widget.label!,
            style: AppTextStyle.regularSemiBold.copyWith(
              color: Colors.black45,
            ),
          ),
        ValueListenableBuilder(
          valueListenable: isObscure,
          builder: (context, obscure, child) {
            return TextField(
              controller: widget.controller,
              obscureText: obscure,
              style: AppTextStyle.regularSemiBold.copyWith(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: AppTextStyle.regularSemiBold.copyWith(
                  color: AppColors.grey200,
                ),
                suffix: widget.obscureText
                    ? GestureDetector(
                        onTap: () {
                          isObscure.value = !obscure;
                        },
                        child: Icon(
                          obscure ? Icons.visibility : Icons.visibility_off,
                          color: obscure ? AppColors.primary : Colors.black45,
                        ),
                      )
                    : null,
              ),
            );
          },
        ),
      ],
    );
  }
}
