import 'package:boilerplate/core/router/app_routes.dart';
import 'package:boilerplate/design/constants/text_style.dart';
import 'package:boilerplate/design/widgets/primary_button.dart';
import 'package:boilerplate/design/widgets/secondary_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../../core/router/go.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SecondaryScaffold(
      title: "Second Screen",
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              style: AppTextStyle.small,
            ),
            Text(
              '',
              style: AppTextStyle.title1,
            ),
            Expanded(
              child: Center(
                child: Text(
                  '',
                  style: AppTextStyle.headline1,
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
          bottom: 32,
        ),
        child: PrimaryButton(
          text: "Choose a User",
          onTap: () {
            Go.pushNamed(context, route: AppRoutes.thirdPage);
          },
        ),
      ),
    );
  }
}
