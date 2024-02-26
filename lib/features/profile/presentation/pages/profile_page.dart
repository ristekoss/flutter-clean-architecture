import 'package:boilerplate/design/constants/text_style.dart';
import 'package:boilerplate/design/widgets/primary_button.dart';
import 'package:boilerplate/features/authentication/presentation/pages/login_page.dart';
import 'package:boilerplate/features/profile/presentation/widgets/profile_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const route = '/profile';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 60,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              '@ristekoss',
              style: AppTextStyle.headline1,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const ProfileInfoWidget(label: 'Nama', content: 'Ristek Open Source'),
          const SizedBox(
            height: 16,
          ),
          const ProfileInfoWidget(label: 'Email', content: 'open-source@ristek.cs.ui.ac.id'),
          const SizedBox(
            height: 16,
          ),
          const ProfileInfoWidget(label: 'Address', content: 'Fasilkom UI'),
          const SizedBox(
            height: 24,
          ),
          PrimaryButton(
            text: 'Log Out',
            onTap: () {
              context.go(LoginPage.route);
            },
          )
        ],
      ),
    );
  }
}
