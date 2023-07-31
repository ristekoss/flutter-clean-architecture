import 'package:flutter/material.dart';
import 'package:boilerplate/core/constants/assets.dart';
import 'package:boilerplate/core/router/app_routes.dart';
import 'package:boilerplate/core/router/go.dart';
import 'package:boilerplate/design/widgets/app_text_field.dart';
import 'package:boilerplate/design/widgets/primary_button.dart';
import 'package:boilerplate/features/main/presentation/bloc/main_cubit.dart';
import 'package:boilerplate/features/main/presentation/widgets/dialogs.dart';

import '../../../../services/di.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  late MainCubit _cubit;
  late TextEditingController _nameController;
  late TextEditingController _palindromeController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _palindromeController = TextEditingController();
    _cubit = di<MainCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _palindromeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(Assets.imgBackground), fit: BoxFit.cover)
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Assets.icPhoto),
                const SizedBox(height: 48,),
                AppTextField(controller: _nameController, hint: 'Name'),
                const SizedBox(height: 16,),
                AppTextField(controller: _palindromeController, hint: 'Palindrome'),
                const SizedBox(height: 48,),
                PrimaryButton(
                  text: 'CHECK',
                  onTap: (){
                    final res = _cubit.isPalindrome(_palindromeController.text);
                    if(res){
                      MainDialogs.showAlertDialog("isPalindrome", context);
                    } else {
                      MainDialogs.showAlertDialog("not palindrome", context);
                    }
                  },
                ),
                const SizedBox(height: 8,),
                PrimaryButton(
                  text: 'NEXT',
                  onTap: (){
                    if(_nameController.text.isEmpty){
                      MainDialogs.showAlertDialog("Fill name first!", context);
                    } else {
                      _cubit.login(_nameController.text);
                      Go.goNamed(context, route: AppRoutes.secondPage);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
