import 'package:boilerplate/core/utils/formatter/phone_formatter.dart';
import 'package:boilerplate/design/widgets/atom/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../../design/constants/colors.dart';
import '../../../../design/constants/text_style.dart';
import '../../../../design/widgets/atom/app_text_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  static const route = '/forgot_password';

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const Icon(
              Icons.lock_reset,
              color: AppColors.primary,
              size: 100,
            ),
            Text(
              'Lupa kata sandi?',
              style: AppTextStyle.headline1.copyWith(
                color: AppColors.secondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Kami akan mengirimkan OTP untuk mengganti kata sandimu',
              style: AppTextStyle.regularSemiBold.copyWith(
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 24,
            ),
            AppTextField(
              controller: _phoneController,
              label: 'Nomor Telepon',
              hint: 'Masukkan nomor telepon...',
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                PhoneFormatter(),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            PrimaryButton(
              text: 'Kirim',
              onTap: () {
                context.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
