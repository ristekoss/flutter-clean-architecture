import 'package:flutter/services.dart';

class PhoneFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    final stringBuffer = StringBuffer();

    final text = newValue.text;
    for (int i = 0; i < text.length; i++) {
      stringBuffer.write(text[i]);
      if ((i + 1) % 4 == 0 && (i + 1) != text.length) {
        stringBuffer.write(' ');
      }
    }

    final string = stringBuffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}
