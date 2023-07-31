import 'package:flutter/material.dart';
import 'package:boilerplate/core/router/go.dart';

import '../constants/colors.dart';
import '../constants/text_style.dart';

class SecondaryScaffold extends StatelessWidget {
  final Widget? body;
  final Widget? bottomNavigationBar;
  final String title;
  final VoidCallback? onBack;
  const SecondaryScaffold({Key? key, this.body, this.bottomNavigationBar, required this.title, this.onBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: AppTextStyle.appBar,),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.blue,),
          onPressed: () => onBack ?? Go.pop(context),
        ),
      ),
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
