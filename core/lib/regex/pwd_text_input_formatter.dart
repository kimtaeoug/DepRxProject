import 'package:flutter/services.dart';

import 'regex.dart';

class PwdTextInputFormatter extends TextInputFormatter {
  final Regex _regex = Regex();

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String filteredText = newValue.text.split('').where((char) {
      if (_regex.hasEn(char) ||
          _regex.hasNumber(char) ||
          _regex.hasSpecialCharacter(char)) {
        return true;
      }
      return false;
    }).join('');
    return newValue.copyWith(text: filteredText);
  }
}
