import 'package:boilerplate/design/widgets/atom/page_indicator.dart';
import 'package:boilerplate/features/authentication/presentation/pages/login_page.dart';
import 'package:boilerplate/features/onboarding/presentation/widgets/onboarding_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../design/widgets/atom/primary_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  static const route = '/onboarding';

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _controller;
  late ValueNotifier<int> _activePage;

  @override
  void initState() {
    _controller = PageController();
    _activePage = ValueNotifier(0);

    _controller.addListener(() {
      _activePage.value = (_controller.page ?? 0.0).toInt();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _activePage.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 48,
              ),
              Expanded(
                child: PageView(
                  controller: _controller,
                  children: const [
                    OnboardingBody(
                      icon: Icons.flash_on,
                      title: 'Mempercepat',
                      subtitle:
                          'Kamu tidak perlu setup semuanya dari nol, template ini sudah menyiapkan semua pengaturan yang dibutuhkan',
                    ),
                    OnboardingBody(
                      icon: Icons.data_object,
                      title: 'dummyJson',
                      subtitle:
                          'Template ini memanfaatkan data dari dummyJSON.com untuk sumber datanya. Kamu tidak perlu menjalankan BE lokal untuk mencoba aplikasi ini',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Align(
                alignment: Alignment.center,
                child: ValueListenableBuilder(
                  valueListenable: _activePage,
                  builder: (context, page, _) {
                    return PageIndicator(
                      activeIndex: page,
                      length: 2,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              ValueListenableBuilder(
                valueListenable: _activePage,
                builder: (context, page, _) {
                  return PrimaryButton(
                    text: page == 0 ? 'Lanjut' : 'Mulai',
                    onTap: () {
                      if (page == 0) {
                        _controller.animateToPage(
                          1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                        return;
                      }
                      context.pushReplacementNamed(LoginPage.route);
                    },
                  );
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
