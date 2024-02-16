import 'package:boilerplate/features/onboarding/presentation/blocs/events/init_onboarding_event.dart';
import 'package:boilerplate/features/onboarding/presentation/blocs/onboarding_bloc.dart';
import 'package:boilerplate/features/onboarding/presentation/blocs/onboarding_states.dart';
import 'package:boilerplate/features/onboarding/presentation/blocs/states/init_onboarding_states.dart';
import 'package:boilerplate/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../design/constants/colors.dart';
import '../../../../design/constants/text_style.dart';
import '../../../../services/di.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const route = '/splash';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    di<OnboardingBloc>().add(GetLocalDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<OnboardingBloc, OnboardingStates>(
        bloc: di<OnboardingBloc>(),
        listenWhen: (prev, next) {
          return next != prev;
        },
        listener: (context, state) {
          if (state is InitOnboardingSuccessState) {
            context.pushReplacementNamed(OnboardingPage.route);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(20)),
                child: const Icon(
                  Icons.shopping_bag,
                  color: Colors.white,
                  size: 100,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Flutter Shop',
              style:
                  AppTextStyle.headline1.copyWith(color: AppColors.secondary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
