import 'dart:developer';

import 'package:boilerplate/core/router/app_routes.dart';
import 'package:boilerplate/design/constants/colors.dart';
import 'package:boilerplate/design/constants/text_style.dart';
import 'package:boilerplate/design/widgets/app_text_button.dart';
import 'package:boilerplate/design/widgets/app_text_field.dart';
import 'package:boilerplate/design/widgets/primary_button.dart';
import 'package:boilerplate/features/authentication/presentation/blocs/authentication_bloc.dart';
import 'package:boilerplate/features/authentication/presentation/blocs/authentication_states.dart';
import 'package:boilerplate/features/authentication/presentation/blocs/events/login_refresh_events.dart';
import 'package:boilerplate/features/authentication/presentation/blocs/events/post_login_events.dart';
import 'package:boilerplate/features/authentication/presentation/blocs/states/post_login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../services/di.dart';

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
          child: BlocConsumer<AuthenticationBloc, AuthenticationStates>(
            bloc: di<AuthenticationBloc>(),
            listenWhen: (p, n) {
              return n is PostLoginLoadingState ||
                  n is PostLoginSuccessState ||
                  n is PostLoginErrorState;
            },
            listener: (context, state) {
              log(state.toString());
              if (state is PostLoginSuccessState) {
                context.pushReplacementNamed(AppRoutes.secondPage);
              }
            },
            buildWhen: (p, n) {
              return n is PostLoginLoadingState ||
                  n is PostLoginSuccessState ||
                  n is PostLoginErrorState ||
                  n is PostLoginInitState;
            },
            builder: (context, state) {
              return Column(
                children: [
                  const Icon(
                    Icons.shopping_bag,
                    color: AppColors.primary,
                    size: 100,
                  ),
                  Text(
                    'Flutter Shop',
                    style: AppTextStyle.headline1.copyWith(
                      color: AppColors.secondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  if (state is PostLoginErrorState)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        state.message,
                        style: AppTextStyle.regularSemiBold.copyWith(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  AppTextField(
                    controller: _nameController,
                    label: 'Username',
                    hint: 'Masukkan username',
                    onChanged: (_) {
                      if (state is PostLoginErrorState) {
                        di<AuthenticationBloc>().add(LoginRefreshEvent());
                      }
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  AppTextField(
                    controller: _passwordController,
                    obscureText: true,
                    label: 'Password',
                    hint: 'Masukkan password',
                    onChanged: (_) {
                      if (state is PostLoginErrorState) {
                        di<AuthenticationBloc>().add(LoginRefreshEvent());
                      }
                    },
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
                    isLoading: state is PostLoginLoadingState,
                    onTap: () {
                      di<AuthenticationBloc>().add(
                        PostLoginEvent(
                          username: _nameController.text,
                          password: _passwordController.text,
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
