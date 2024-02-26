import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/colors.dart';
import '../../constants/text_style.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String? label;
  final bool obscureText;
  final bool isError;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextField({
    Key? key,
    required this.controller,
    required this.hint,
    this.label,
    this.onChanged,
    this.obscureText = false,
    this.isError = false,
    this.inputFormatters,
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
  void dispose() {
    super.dispose();
    isObscure.dispose();
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
              color: widget.isError ? Colors.red : Colors.black45,
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
              onChanged: widget.onChanged,
              inputFormatters: widget.inputFormatters,
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
