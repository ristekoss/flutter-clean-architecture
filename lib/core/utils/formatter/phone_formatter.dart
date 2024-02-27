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
    const sectionLength = 4;
    const separator = '-';

    final text = newValue.text;
    for (int i = 0; i < text.length; i++) {
      stringBuffer.write(text[i]);
      final indexAfter = i+1;
      if (indexAfter % sectionLength == 0 && indexAfter != text.length) {
        stringBuffer.write(separator);
      }
    }

    return newValue.copyWith(
      text: stringBuffer.toString(),
      selection: TextSelection.collapsed(offset: stringBuffer.length),
    );
  }
}
