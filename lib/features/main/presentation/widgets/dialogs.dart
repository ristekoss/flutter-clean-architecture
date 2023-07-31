import 'package:flutter/material.dart';
import 'package:boilerplate/design/constants/text_style.dart';

class MainDialogs {
  static Future<void> showAlertDialog(String text, BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Result', style: AppTextStyle.headline1,),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(text, style: AppTextStyle.headline3,),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK', style: AppTextStyle.title1,),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}