import 'package:boilerplate/core/router/app_routes.dart';
import 'package:boilerplate/design/constants/colors.dart';
import 'package:boilerplate/design/constants/text_style.dart';
import 'package:boilerplate/design/widgets/app_text_button.dart';
import 'package:boilerplate/design/widgets/app_text_field.dart';
import 'package:boilerplate/design/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const route = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _nameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Icon(
                Icons.shopping_bag,
                color: AppColors.primary,
                size: 100,
              ),
              Text(
                'Flutter Shop',
                style: AppTextStyle.headline1.copyWith(color: AppColors.secondary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 64,
              ),
              AppTextField(
                controller: _nameController,
                label: 'Username',
                hint: 'Masukkan username',
              ),
              const SizedBox(
                height: 24,
              ),
              AppTextField(
                controller: _passwordController,
                obscureText: true,
                label: 'Password',
                hint: 'Masukkan password',
              ),
              const SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: AppTextButton(
                  label: 'Lupa kata sandi?',
                  onTap: () {},
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              PrimaryButton(
                text: 'Log in',
                onTap: () {
                  context.pushReplacementNamed(AppRoutes.secondPage);
                },
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
